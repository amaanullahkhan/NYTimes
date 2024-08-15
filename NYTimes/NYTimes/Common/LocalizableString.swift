//
//  StringConstants.swift
//  NYTimes
//
//  Created by Amaan Ullah on 15/08/2024.
//

import Foundation

private extension String {
    var localised: String {
        NSLocalizedString(self, comment: "")
    }
}

enum Localizable {
    
    static let mostPopular = Key.mostPopular.localised
    
    private enum Key {
        static let mostPopular = "most_popular"
    }
}
