//
//  ReviewListPresenter.swift
//  review
//
//  Created by 김동주 on 2022/02/03.
//


import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    
    private var review: [NewsReview] = []
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
        
    }
        
        func viewDidLoad() {
            viewController.setupNavigationBar()
            viewController.setupViews()
    }
    
    func viewWillAppear() {
        review = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
    
}

extension ReviewListPresenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title.htmlToString
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(with: review.imageURL)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        if editingStyle == .delete {
            review.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
        }
    }
}









