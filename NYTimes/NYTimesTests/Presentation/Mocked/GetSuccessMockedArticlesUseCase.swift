//
//  GetSuccessMockedArticlesUseCase.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import Foundation
import Combine
@testable import NYTimes

struct GetSuccessMockedArticlesUseCase: GetArticlesUseCase {
    
    let articles = [Article(id: 1, title: "Title 1", description: "Description 1", publishedDate: Date(), publishedBy: "Publisher 1", media: []),
                    Article(id: 1, title: "Title 2", description: "Description 2", publishedDate: Date(), publishedBy: "Publisher 2", media: []),
                    Article(id: 1, title: "Title 3", description: "Description 3", publishedDate: Date(), publishedBy: "Publisher 3", media: []),
                    Article(id: 1, title: "Title 4", description: "Description 4", publishedDate: Date(), publishedBy: "Publisher 4", media: []),
                    Article(id: 1, title: "Title 5", description: "Description 5", publishedDate: Date(), publishedBy: "Publisher 5", media: [])]
    
    func getArticles() -> AnyPublisher<[Article], Error> {
        Just(articles)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
