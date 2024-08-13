//
//  ArticlesView.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject private var viewModel: ArticlesViewModel = ArticlesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articleViewModels) { articleViewModel in
                ArticleView(viewModel: articleViewModel)
            }
            .navigationTitle(viewModel.title)
        }
        .task {
            viewModel.getArticles()
        }
        
    }
}

#Preview {
    ArticlesView()
}