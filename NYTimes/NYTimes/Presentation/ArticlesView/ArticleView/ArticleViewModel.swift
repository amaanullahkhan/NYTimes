//
//  ArticleViewModel.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation

struct ArticleViewModel: Identifiable {
    
    let id: Int
    let title: String
    let description: String
    let publishDate: String
    let imageUrl: URL?
    let article: Article
    
    init(article: Article) {
        id = article.id
        title = article.title
        description = article.description
        publishDate = article.publishedDate.formatted(date: .abbreviated, time: .omitted)
        imageUrl = article.imageURL
        self.article = article
    }
}
