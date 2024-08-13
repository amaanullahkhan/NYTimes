//
//  Network.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation

enum NetworkAPI {

    static let key = "KDTgsLu7iqIYYjrTc1hHxNvtFkjlhO6f"
    
    static let baseURL = URL(string: "https://api.nytimes.com/")!
    
    static let popularArticlesURL: URL = baseURL
        .appendingPathComponent("svc/mostpopular/v2/mostviewed/all-sections/7.json")
        .appending(queryItems: [URLQueryItem(name: "api-key", value: key)])
}
