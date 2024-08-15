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
        NavigationStack {
            List(viewModel.articleViewModels) { articleViewModel in
                NavigationLink {
                    ArticleDetailsView(viewModel: articleViewModel.makeArticleDetailsViewModel())
                } label: {
                    ArticleView(viewModel: articleViewModel)
                }
            }
            .overlay(content: {
                if viewModel.isError {
                    VStack {
                        Text(viewModel.errorMessage)
                        Button {
                            viewModel.retry()
                        } label: {
                            Text(viewModel.retryActionTitle)
                        }
                    }
                }
            })
            .overlay(content: {
                if viewModel.isLoading {
                    ProgressView()
                }
            })
            .scrollIndicators(.hidden)
            .navigationTitle(viewModel.title)
            .refreshable {
                viewModel.refresh()
            }
        }
        .task {
            viewModel.getArticles()
        }
    }
}

#Preview {
    ArticlesView()
}
