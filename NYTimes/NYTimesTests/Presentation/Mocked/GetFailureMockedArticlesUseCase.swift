//
//  GetSuccessMockedArticlesUseCase.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import Foundation
import Combine
@testable import NYTimes

struct GetFailureMockedArticlesUseCase: GetArticlesUseCase {
    
    func getArticles() -> AnyPublisher<[Article], Error> {
        Fail(error: ArticelsError.somethingWentWrong)
            .eraseToAnyPublisher()
    }
    
    enum ArticelsError: Error {
        case somethingWentWrong
    }
}
