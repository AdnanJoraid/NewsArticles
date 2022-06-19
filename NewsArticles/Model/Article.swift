//
//  Article.swift
//  NewsArticles
//
//  Created by Adnan Joraid on 2022-06-19.
//

import Foundation

struct Article: Decodable, Identifiable {
    let id = UUID()
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let content: String?
}




