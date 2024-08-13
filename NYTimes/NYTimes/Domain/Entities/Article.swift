//
//  Article.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation

struct Article: Decodable {
    
    let id: Int
    let title: String
    let description: String
    let publishedDate: Date
    let publishedBy: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "abstract"
        case publishedDate = "published_date"
        case publishedBy = "byline"
        case media
    }
}

extension Article {
    var imageURL: URL? {
        media.first?.mediaMetadata.first?.url
    }
}

struct Media: Decodable {
    var mediaMetadata: [MetaData]
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MetaData: Decodable {
    var url: URL
}
