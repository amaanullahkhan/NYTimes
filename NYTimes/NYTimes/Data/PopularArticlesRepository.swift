//
//  PopularArticlesRepository.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

struct PopularArticlesRepository: ArticlesRepository {
    
    let networkData: NetworkData
    
    init(networkData: NetworkData = URLSessionNetworkData()) {
        self.networkData = networkData
    }
    
    func fetchArticles() -> AnyPublisher<[Article], Error> {
        let url = NetworkAPI.popularArticlesURL
        let response: AnyPublisher<PopularArticlesResponse, Error>
        response = networkData.fetch(from: url)
        return response.map(\.results).eraseToAnyPublisher()
    }
}

private struct PopularArticlesResponse: Decodable {
    var results: [Article]
}
