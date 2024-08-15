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
    static let retry = Key.retry.localised
    static let somethingWentWrong = Key.somethingWentWrong.localised
    
    private enum Key {
        static let mostPopular = "most_popular"
        static let retry = "retry"
        static let somethingWentWrong = "something_went_wrong"
    }
}
