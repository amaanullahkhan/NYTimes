//
//  NetworkError.swift
//  NYTimes
//
//  Created by Amaan Ullah on 16/08/2024.
//

import Foundation

enum NetworkError: Error {
    case somethingWentWrong
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            Localizable.somethingWentWrong
        }
    }
}
