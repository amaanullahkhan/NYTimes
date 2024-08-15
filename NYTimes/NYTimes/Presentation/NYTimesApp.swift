//
//  NYTimesApp.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import SwiftUI

@main
struct NYTimesApp: App {
    
    @StateObject private var articlesViewModel = ArticlesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ArticlesView(viewModel: articlesViewModel)
        }
    }
}
