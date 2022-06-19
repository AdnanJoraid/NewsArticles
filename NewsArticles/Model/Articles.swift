//
//  Articles.swift
//  NewsArticles
//
//  Created by Adnan Joraid on 2022-06-19.
//

import Foundation

struct Articles: Decodable, Identifiable {
    let id = UUID()
    let articles: [Article]
}
