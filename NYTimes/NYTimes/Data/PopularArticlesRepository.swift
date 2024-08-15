//
//  PopularArticlesRepository.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

struct PopularArticlesRepository: ArticlesRepository {
    
    let manager: NetworkRequestManager
    
    init(manager: NetworkRequestManager = URLSessionNetworkRequestManager()) {
        self.manager = manager
    }
    
    func fetchArticles() -> AnyPublisher<[Article], Error> {
        let params = [NetworkAPI.Constant.apiKey: NetworkAPI.Key.apiKey]
        let mostPopularRequest = NetworkAPI.Routes.MostPopularArticles.get(parameters: params)
        let response: AnyPublisher<PopularArticlesResponse, Error>
        response = manager.perform(request: mostPopularRequest)
        return response.map(\.results).eraseToAnyPublisher()
    }
}

private struct PopularArticlesResponse: Decodable {
    var results: [Article]
}
