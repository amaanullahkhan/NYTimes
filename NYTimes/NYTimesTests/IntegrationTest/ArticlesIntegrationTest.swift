//
//  ArticlesIntegrationTest.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 15/08/2024.
//

import XCTest
import Combine
@testable import NYTimes

final class ArticlesIntegrationTest: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()
    
    override func tearDownWithError() throws {
        cancellables = []
    }
    
    func testArticlesCountAndTitleWhenSuccessfullyFetchArticles() {
        
        // Given
        let useCase = GetPopularArticlesUseCase(repository: SuccessMockedArticlesRepository())
        let viewModel = ArticlesViewModel(useCase: useCase)
        let expectation = expectation(description: "ArticlesViewModel's articles count and title")
        let expectedCount = 5
        let expectedTitle = "Title 5"
        var resultCount: Int?
        var resultTitle: String?
        
        // When
        viewModel.$articleViewModels
            .dropFirst()
            .sink(receiveValue: { articles in
                resultCount = articles.count
                resultTitle = articles.last?.title
                expectation.fulfill()
            }).store(in: &cancellables)
        viewModel.getArticles()
        waitForExpectations(timeout: 1)
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultTitle, expectedTitle)
    }
    
    func testArticlesCountAndTitleWhenFailedToFetchArticles() {
        
        // Given
        let useCase = GetPopularArticlesUseCase(repository: SuccessMockedArticlesRepository())
        let viewModel = ArticlesViewModel(useCase: useCase)
        let expectedCount = 0
        let expectedTitle: String? = nil
        var resultCount: Int?
        var resultTitle: String?
        
        // When
        viewModel.$articleViewModels.sink(receiveValue: { articles in
            resultCount = articles.count
            resultTitle = articles.last?.title
        }).store(in: &cancellables)
        viewModel.getArticles()
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultTitle, expectedTitle)
    }

}
