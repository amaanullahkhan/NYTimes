//
//  Network.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation

enum NetworkAPI {

    enum Constant {
        static let v2 = "v2"
        static let svc = "svc"
        static let apiKey = "api-key"
        static let mostpopular = "mostpopular"
        static let mostviewed = "mostviewed"
        static let allSections = "all-sections"
        static let jsonVersion = "7.json"
    }
    
    enum Key {
        static let apiKey = "KDTgsLu7iqIYYjrTc1hHxNvtFkjlhO6f"
    }
    
    enum URLs {
        static let baseURL = URL(string: "https://api.nytimes.com/")!
    }
}
