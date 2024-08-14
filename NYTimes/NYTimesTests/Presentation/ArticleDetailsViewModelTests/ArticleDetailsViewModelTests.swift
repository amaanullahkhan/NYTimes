//
//  ArticleDetailsViewModelTests.swift
//  NYTimesTests
//
//  Created by Amaan Ullah on 14/08/2024.
//

import XCTest
@testable import NYTimes

final class ArticleDetailsViewModelTests: XCTestCase {
    
    var sut: ArticleDetailsViewModel?
    
    override func setUp() {
        sut = ArticleDetailsViewModel(article: .testArticles.first!)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testArticleDetailsViewModelTitle() {
        // Given
        let expected = "Title 1"
        var result: String?
        
        // When
        result = sut?.title
        
        // Then
        XCTAssertEqual(result, expected)
    }
    
    func testArticleDetailsViewModelDescription() {
        // Given
        let expected = "Description 1"
        var result: String?
        
        // When
        result = sut?.description
        
        // Then
        XCTAssertEqual(result, expected)
    }
    
    func testArticleDetailsViewModelPublisher() {
        // Given
        let expected = "Publisher 1"
        var result: String?
        
        // When
        result = sut?.publishedBy
        
        // Then
        XCTAssertEqual(result, expected)
    }

}
