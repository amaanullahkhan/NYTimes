//
//  Router.swift
//  NYTimes
//
//  Created by Amaan Ullah on 15/08/2024.
//

import Foundation

typealias Parameters = [String : String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkRoutable {
    var route: URL { get }
    init()
}

/// Allows to perform the `.get` method
protocol NetworkReadable: NetworkRoutable { }

extension NetworkReadable {
    
    static func get(parameters: Parameters = [:]) -> URLRequestConvertable {
        let readable = Self.init()
        let route = readable.route
        return NetworkRequest(method: .get, route: route, parameters: parameters)
    }
}

/// Allows to perform the `.post` method
protocol NetworkPostable: NetworkRoutable {}

extension NetworkPostable {
    
    static func post(parameters: Parameters = [:]) -> URLRequestConvertable {
        let postable = Self.init()
        let route = postable.route
        return NetworkRequest(method: .post, route: route, parameters: parameters)
    }
}
