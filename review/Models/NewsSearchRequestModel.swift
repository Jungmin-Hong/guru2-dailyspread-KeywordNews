//
//  NewsSearchRequestModel.swift
//  review
//
//  Created by 김동주 on 2022/02/03.
//

import Foundation


struct NewsSearchRequestModel: Codable {
    /// 검색할 책 키워드
    
    let query: String
}
