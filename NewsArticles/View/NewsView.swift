//
//  NewsView.swift
//  NewsArticles
//
//  Created by Adnan Joraid on 2022-06-19.
//

import SwiftUI

struct NewsView: View {
    let article : Article
    var body: some View {
        ScrollView {
            Text(article.title ?? "")
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            VStack{
                AsyncImage(
                    url: URL(string:article.urlToImage ?? ""),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 600, maxHeight: 300)
                            .edgesIgnoringSafeArea(.top)
                            .padding(.top)
                    },
                    placeholder: {
                        ProgressView()
                    }
                    
                )
                
                Text("Author: \(article.author ?? "No Author")")
                Text(article.description ?? "")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()

            }


            
        }
        .navigationTitle(Text("News Article"))

    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(article: Article(author: "TEST", title: "TEST", description: "TEST", urlToImage: "TEST", content: "TEST"))
    }
}
