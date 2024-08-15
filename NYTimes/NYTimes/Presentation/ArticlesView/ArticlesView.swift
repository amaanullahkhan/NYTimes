//
//  ArticlesView.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @ObservedObject var viewModel: ArticlesViewModel
    
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
                if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .multilineTextAlignment(.center)
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
    ArticlesView(viewModel: ArticlesViewModel())
}
