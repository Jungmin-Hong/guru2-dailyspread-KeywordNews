//
//  NewsListPresenterTests.swift
//  KeywordNewsTests
//
//  Created by 지혜 on 2022/01/31.
//

import XCTest
@testable import KeywordNews
import SwiftUI

class NewsListPresenterTests: XCTestCase {
    var sut: NewsListPresenter!
    
    var viewController : MockNewsListViewController!
    var newsSearchManager: MockNewsSearchManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockNewsListViewController()
        newsSearchManager = MockNewsSearchManager()

        sut = NewsListPresenter(viewContorller: viewController, newsSearchManager: newsSearchManager)
    }
    
    override func tearDown() {
         sut = nil
        newsSearchManager = nil
        viewController = nil
        
        super.tearDown()
    }

    func test_viewDidLoad가_요청될때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupLayout)
        
    }
    
    func test_didCalledRefresh가_요청될때_request에_실패하면() {
        newsSearchManager.error = NSError() as Error
        sut.didCalledRefresh()
        
        XCTAssertFalse(viewController.isCalledReLoadTableView)
        XCTAssertFalse(viewController.isCallEndRefreshing)
    }
    
    func test_didCalledRefresh가_요청될때_request에_성공하면() {
       
        newsSearchManager.error = nil
       
        sut.didCalledRefresh()
        
        XCTAssertTrue(viewController.isCalledReLoadTableView)
        XCTAssertTrue(viewController.isCallEndRefreshing)
    }
}


