//
//  ReviewWritePresenter.swift
//  review
//
//  Created by 김동주 on 2022/02/03.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
    func presentToSearchNewsViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var news: News_s?
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    
    init(viewController: ReviewWriteProtocol)
    {
        self.viewController = viewController
    }
    
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertController()
    }
 
    func didTapRightBarButton(contentsText: String?) {
        
        guard
            let news = news,
            let contentsText = contentsText,
            contentsText != contentsTextViewPlaceHolderText
        else { return }

        let newsReview = NewsReview(
            title: news.title,
            contents: contentsText,
            imageURL: news.imageURL
        )
        
        userDefaultsManager.setReview(newsReview)
        viewController.close()
    }
    
    func didTapNewsTitleButton() {
        viewController.presentToSearchNewsViewController()
    }
    
}

extension ReviewWritePresenter: SearchNewsDelegate {
    func selectNews(_ news: News_s) {
        self.news = news
        
        viewController.updateViews(title: news.title.htmlToString, imageURL:     news.imageURL)
    }
}
