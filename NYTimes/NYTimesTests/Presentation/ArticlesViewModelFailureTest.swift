//
//  ArticlesViewModelTests.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import XCTest
import Combine
@testable import NYTimes

final class ArticlesViewModelTests: XCTestCase {
    
    var sut: ArticlesViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = ArticlesViewModel(useCase: GetFailureMockedArticlesUseCase())
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables = []
    }
    
    func testArticlesCountAndTitleWhenFailedToFetchArticles() {
        
        // Given
        let expectedCount = 0
        let expectedTitle: String? = nil
        var resultCount: Int?
        var resultTitle: String?
        
        // When
        sut?.$articleViewModels.sink(receiveValue: { articles in
            resultCount = articles.count
            resultTitle = articles.last?.title
        }).store(in: &cancellables)
        sut?.getArticles()
        
        // Then
        XCTAssertEqual(resultCount, expectedCount)
        XCTAssertEqual(resultTitle, expectedTitle)
    }

}
