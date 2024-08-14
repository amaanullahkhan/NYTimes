//
//  GetPopularArticlesUseCase.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import XCTest
import Combine
@testable import NYTimes

final class GetPopularArticlesUseCaseTests: XCTestCase {
    
    var sut: GetPopularArticlesUseCase?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables = []
    }
    
    func testPopularArticlesCountAndTitleWhenSuccessfullyFetchArticles() {
        
        // Given
        sut = GetPopularArticlesUseCase(repository: SuccessMockedArticlesRepository())
        let expectedCount = 5
        let expectedTitle = "Title 5"
        var resultCount: Int?
        var resultTitle: String?
        
        // When
        sut?.getArticles()
            .replaceError(with: [])
            .sink(receiveValue: { articles in
                resultCount = articles.count
                resultTitle = articles.last?.title
            })
            .store(in: &cancellables)
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultTitle, expectedTitle)
    }
    
    func testPopularArticlesErrorWhenFailedtoFetchArticles() {
        
        // Given
        sut = GetPopularArticlesUseCase(repository: FailureMockedArticlesRepository())
        let expectedError = FailureMockedArticlesRepository.ArticelsError.somethingWentWrong
        var resultError: FailureMockedArticlesRepository.ArticelsError?
        
        // When
        sut?.getArticles()
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    resultError = error as? FailureMockedArticlesRepository.ArticelsError
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        // Then
        XCTAssertEqual(resultError, expectedError)
    }

}
