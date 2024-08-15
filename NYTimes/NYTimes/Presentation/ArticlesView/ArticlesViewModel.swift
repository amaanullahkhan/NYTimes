//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject {
    
    let title: String = "Most Popular"
    
    @Published
    private(set) var articleViewModels: [ArticleViewModel] = []
    
    private var useCase: GetArticlesUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: GetArticlesUseCase = GetPopularArticlesUseCase()) {
        self.useCase = useCase
    }
    
    func getArticles() {
        useCase.getArticles()
            .map { $0.map { ArticleViewModel(article: $0) } }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [unowned self] viewModels in
                articleViewModels = viewModels
            }
            .store(in: &cancellables)
    }
}
