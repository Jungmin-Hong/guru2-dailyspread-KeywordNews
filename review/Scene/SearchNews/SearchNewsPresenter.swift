//
//  SearchNewsPresenter.swift
//  KeywordNews
//
//  Created by 홍정민 on 2022/02/04.
//

import UIKit


protocol SearchNewsProtocol {
    func setupViews()
    func dismiss()
    func reloadView()
}

protocol SearchNewsDelegate {
    func selectNews(_ news: News_s)
}


final class SearchNewsPresenter :NSObject {
    private let viewController: SearchNewsProtocol
    private let newsSearchManager = NewssSearchManager()
    
    private var delegate: SearchNewsDelegate
    
    private var news: [News_s] = []
    
    init(viewController: SearchNewsProtocol, delegate: SearchNewsDelegate) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        viewController.setupViews()
    }
}


extension SearchNewsPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        newsSearchManager.request(from: searchText) { [weak self] newNews in
            self?.news = newNews
            self?.viewController.reloadView()
        }
    }
}

extension SearchNewsPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNews = news[indexPath.row]
        delegate.selectNews(selectedNews)
        
        viewController.dismiss()
    }
}

extension SearchNewsPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = news[indexPath.row].title.htmlToString
        
        return cell
    }
}

