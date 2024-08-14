//
//  GetArticlesRepository.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

protocol ArticlesRepository {
    func fetchArticles() -> AnyPublisher<[Article], Error>
}
