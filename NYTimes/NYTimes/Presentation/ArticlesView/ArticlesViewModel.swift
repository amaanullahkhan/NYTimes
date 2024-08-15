//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject {
    
    let title: String = Localizable.mostPopular
    let retryActionTitle: String = Localizable.retry
    let errorMessage: String = Localizable.somethingWentWrong
    
    @Published
    private(set) var isLoading: Bool = false
    
    @Published
    private(set) var isError: Bool = false
    
    @Published
    private(set) var articleViewModels: [ArticleViewModel] = []
    
    private var useCase: GetArticlesUseCase
    private var cancellable: AnyCancellable?
    
    init(useCase: GetArticlesUseCase = GetPopularArticlesUseCase()) {
        self.useCase = useCase
    }
    
    func getArticles() {
        isLoading = true
        isError = false
        cancellable = useCase.getArticles()
            .map { $0.map { ArticleViewModel(article: $0) } }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                isLoading = false
                if case .failure = completion {
                    isError = true
                }
            } receiveValue: { [unowned self] viewModels in
                isLoading = false
                articleViewModels = viewModels
            }
    }
    
    func refresh() {
        getArticles()
    }
    
    func retry() {
        getArticles()
    }
}
