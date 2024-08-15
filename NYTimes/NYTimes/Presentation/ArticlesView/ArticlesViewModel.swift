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
    
    @Published
    private(set) var errorMessage: String?
    
    @Published
    private(set) var isLoading: Bool = false
    
    @Published
    private(set) var articleViewModels: [ArticleViewModel] = []
    
    private var useCase: GetArticlesUseCase
    private var cancellable: AnyCancellable?
    
    init(useCase: GetArticlesUseCase = GetPopularArticlesUseCase()) {
        self.useCase = useCase
    }
    
    func getArticles() {
        isLoading = true
        errorMessage = nil
        cancellable = useCase.getArticles()
            .map { $0.map { ArticleViewModel(article: $0) } }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                isLoading = false
                if case .failure(let error) = completion {
                    errorMessage = error.localizedDescription
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
