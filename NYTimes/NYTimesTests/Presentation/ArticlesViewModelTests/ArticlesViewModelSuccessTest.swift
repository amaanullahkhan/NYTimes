//
//  ArticlesViewModelTests.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import XCTest
import Combine
@testable import NYTimes

final class ArticlesViewModelSuccessTest: XCTestCase {
    
    var sut: ArticlesViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = ArticlesViewModel(useCase: GetSuccessMockedArticlesUseCase())
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables = []
    }
    
    func testArticlesCountAndTitleWhenSuccessfullyFetchArticles() {
        
        // Given
        let expectation = expectation(description: "ArticlesViewModel's articles count and title")
        let expectedCount = 5
        let expectedTitle = "Title 5"
        var resultCount: Int?
        var resultTitle: String?
        
        // When
        sut?.$articleViewModels
            .dropFirst()
            .sink(receiveValue: { articles in
                resultCount = articles.count
                resultTitle = articles.last?.title
                expectation.fulfill()
            }).store(in: &cancellables)
        sut?.getArticles()
        waitForExpectations(timeout: 1)
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultTitle, expectedTitle)
    }

}
