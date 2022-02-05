//
//  News.swift
//  review
//
//  Created by 김동주 on 2022/02/03.
//

import Foundation

struct News_s: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
}
