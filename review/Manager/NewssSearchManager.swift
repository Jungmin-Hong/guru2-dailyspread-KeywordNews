//
//  NewsSearchManager.swift
//  review
//
//  Created by 김동주 on 2022/02/03.
//

import Alamofire
import Foundation


struct NewssSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([News_s]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }
        
        let parameters = NewsSearchRequestModel(query: keyword)
        
//        id: kxJq07hlC9DToC8QaFtT
//        secret: wHXEyuXB3c
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "kxJq07hlC9DToC8QaFtT",
            "X-Naver-Client-Secret": "wHXEyuXB3c"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).responseDecodable(of: NewssSearchResponseModel.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result.items)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
