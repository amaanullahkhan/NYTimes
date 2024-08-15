//
//  Router.swift
//  NYTimes
//
//  Created by Amaan Ullah on 15/08/2024.
//

import Foundation

typealias Constant = NetworkAPI.Constant

enum NetworkRoute {
        
    enum ArticleRoute: NetworkRequest {
                
        case mostPopularArticles
        
        var method: HTTPMethod {
            switch self {
            case .mostPopularArticles:
                .get
            }
        }
        
        var route: URL {
            switch self {
            case .mostPopularArticles:
                NetworkAPI.URLs.baseURL.appendingPathComponent("\(Constant.svc)/\(Constant.mostpopular)/\(Constant.v2)/\(Constant.mostviewed)/\(Constant.allSections)/\(Constant.jsonVersion)")
            }
        }
        
        var queryParams: Parameters? {
            switch self {
            case .mostPopularArticles:
                [NetworkAPI.Constant.apiKey: NetworkAPI.Key.apiKey]
            }
        }
        
        var bodyParam: Encodable? {
            switch self {
            case .mostPopularArticles:
                nil
            }
        }
        
    }
}

