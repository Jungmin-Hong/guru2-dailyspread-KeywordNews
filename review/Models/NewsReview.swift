//
//  NewsReview.swift
//  review
//
//  Created by 김동주 on 2022/02/04.
//

import Foundation

struct NewsReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
