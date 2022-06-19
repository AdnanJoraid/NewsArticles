//
//  ContentView.swift
//  NewsArticles
//
//  Created by Adnan Joraid on 2022-06-19.
//

import SwiftUI

struct NewsListView: View {
    @State var articlesList: [Article] = []
    @State var errorMessage : String = ""
    var body: some View {
        NavigationView {

                List(articlesList) { article in
                    LazyVStack {
                        NavigationLink(destination: NewsView(article: article)) {
                            Text(article.title ?? "")
                        }
                    }
            }
                .navigationTitle("News")
        }
        .onAppear() {
            NewsAPIManager.shared.getNewsArticles{ result in
                self.errorMessage = ""
                switch (result) {
                case .success(let articles):
                    self.articlesList = articles
                    
                    
                case .failure(let error):
                    self.errorMessage = "Error: \(error)"
                }
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
