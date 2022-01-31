//
//  MockNewsListViewController.swift
//  KeywordNewsTests
//
//  Created by 지혜 on 2022/01/31.
//

import Foundation
@testable import KeywordNews

final class MockNewsListViewController: NewsListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupLayout = false
    var isCallEndRefreshing = false
    var isCalledMoveToNewsWebViewController = false
    var isCalledReLoadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupLayout() {
        isCalledSetupLayout = true
        
    }
    
    func endRefreshing() {
        isCallEndRefreshing = true
    }
    
    func moveToNewsWebViewController(with news: News) {
        isCalledMoveToNewsWebViewController = true
    }
    
    func reloadTableView() {
        isCalledReLoadTableView = true
    }
}
