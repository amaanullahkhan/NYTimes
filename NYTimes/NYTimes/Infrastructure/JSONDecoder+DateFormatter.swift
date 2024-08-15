//
//  JSONDecoder+FormattedDate.swift
//  NYTimes
//
//  Created by Amaan Ullah on 15/08/2024.
//

import Foundation

extension JSONDecoder {
    static let formattedDateDecoder: JSONDecoder = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
