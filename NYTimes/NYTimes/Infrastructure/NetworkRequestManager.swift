//
//  NetworkData.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

protocol NetworkRequestManager {
    func perform<T: Decodable>(request requestConvertable: URLRequestConvertable) -> AnyPublisher<T, Error>
}

struct URLSessionNetworkRequestManager: NetworkRequestManager {
    
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared,
         jsonDecoder: JSONDecoder = JSONDecoder.formattedDateDecoder) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }
    
    func perform<T: Decodable>(request requestConvertable: URLRequestConvertable) -> AnyPublisher<T, Error> {
        URLSession
            .shared
            .dataTaskPublisher(for: requestConvertable.asURLRequest())
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                    throw NetworkError.somethingWentWrong
                    }
                return element.data
                }
            .decode(type: T.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
