//
//  ArticleView.swift
//  NYTimes
//
//  Created by Amaan Ullah on 13/08/2024.
//

import SwiftUI

struct ArticleView: View {

    var viewModel: ArticleViewModel
    
    var body: some View {
        
        HStack(alignment: .center) {
            AsyncImage(url: viewModel.imageUrl) { imagePhase in
                imagePhase.image?.resizable()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                    .lineLimit(2)
                HStack {
                    Text(viewModel.publishedBy)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(viewModel.publishDate)
                        .font(.caption)
                        .italic()
                        .foregroundColor(.accentColor)
                        .lineLimit(1)
                }
            }
        }
    }
}

#Preview {
    ArticleView(viewModel: ArticleViewModel(article: Article(id: 1, title: "Title", description: "Description", publishedDate: Date(), publishedBy: "Author", media: [])))
}
