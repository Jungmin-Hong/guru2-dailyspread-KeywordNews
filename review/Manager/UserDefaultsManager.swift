//
//  UserDefaultsManager.swift
//  review
//
//  Created by 김동주 on 2022/02/04.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [NewsReview]
    func setReview(_ newValue: NewsReview)
}


struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case review
    }
    
    func getReviews() -> [NewsReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([NewsReview].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: NewsReview) {
        var currentReviews: [NewsReview] = getReviews()
        currentReviews.insert(newValue, at: 0)
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue)
         
    }

}
