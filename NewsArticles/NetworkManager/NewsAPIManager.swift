//
//  NewsAPIManager.swift
//  NewsArticles
//
//  Created by Adnan Joraid on 2022-06-19.
//

import Foundation


class NewsAPIManager {
    static let shared = NewsAPIManager()
    let baseUrl = "https://newsapi.org/v2/top-headlines?country=ca&apiKey="
    
    private init(){}
    
    
    func getNewsArticles(completion: @escaping (Result<[Article], NetworkError>) -> Void) {
        let url = URL(string: baseUrl + CONSTANTS.apiKey)!
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                let article = try? JSONDecoder().decode(Articles.self, from: data)
                if let article = article {
                    completion(.success(article.articles))
                    return
                }
                
                completion(.failure(.decodingError))
                return
                
            }
            
        }.resume()
    }
}
