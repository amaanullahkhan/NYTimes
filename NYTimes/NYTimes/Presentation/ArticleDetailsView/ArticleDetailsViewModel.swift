//
//  ArticleDetailsViewModel.swift
//  NYTimes
//
//  Created by Amaan Ullah on 14/08/2024.
//

import Foundation

struct ArticleDetailsViewModel {
    
    let id: Int
    let title: String
    let description: String
    let publishDate: String
    let publishedBy: String
    let imageUrl: URL?
    let imageCaption: String?
}

extension ArticleDetailsViewModel {
    init(article: Article) {
        id = article.id
        title = article.title
        description = article.description
        publishDate = article.publishedDate.formatted(date: .abbreviated, time: .omitted)
        publishedBy = article.publishedBy
        imageUrl = article.largeImageURL
        imageCaption = article.imageCaption
    }
}
