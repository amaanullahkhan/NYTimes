//
//  GetMockedPopularArticlesRepository.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import Foundation
import Combine
@testable import NYTimes

struct SuccessMockedArticlesRepository: ArticlesRepository {
    func fetchArticles() -> AnyPublisher<[Article], Error> {
        Just(Article.testArticles)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct FailureMockedArticlesRepository: ArticlesRepository {
    func fetchArticles() -> AnyPublisher<[Article], Error> {
        Fail(error: ArticelsError.somethingWentWrong)
            .eraseToAnyPublisher()
    }
    
    enum ArticelsError: Error {
        case somethingWentWrong
    }
}
