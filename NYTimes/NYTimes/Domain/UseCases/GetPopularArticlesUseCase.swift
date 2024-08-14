//
//  GetPopularArticles.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

protocol GetArticlesUseCase {
    func getArticles() -> AnyPublisher<[Article], Error>
}

struct GetPopularArticlesUseCase: GetArticlesUseCase {
    
    private let repository: ArticlesRepository
    
    init(repository: ArticlesRepository = PopularArticlesRepository()) {
        self.repository = repository
    }
    
    func getArticles() -> AnyPublisher<[Article], Error> {
        repository.fetchArticles()
    }
}
