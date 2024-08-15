//
//  URLRequestConvertable.swift
//  NYTimes
//
//  Created by Amaan Ullah on 15/08/2024.
//

import Foundation

protocol URLRequestConvertable {
    func asURLRequest() -> URLRequest
}

struct NetworkRequest: URLRequestConvertable {
    
    var method: HTTPMethod
    var route: URL
    var parameters: Parameters = [:]
    
    func asURLRequest() -> URLRequest {
        let queryParams = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        let url = route.appending(queryItems: queryParams)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
