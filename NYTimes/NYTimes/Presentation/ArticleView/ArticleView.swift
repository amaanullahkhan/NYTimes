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
        
        HStack(alignment: .top) {
            AsyncImage(url: viewModel.imageUrl) { imagePhase in
                imagePhase.image?.resizable()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(viewModel.description)
                    .lineLimit(2)
                    .font(.callout)
                    .foregroundColor(.secondary)
                Text(viewModel.publishDate)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.caption)
                    .foregroundColor(.accentColor)
                    .lineLimit(1)
            }
        }
    }
}

#Preview {
    ArticleView(viewModel: ArticleViewModel(id: 1, title: "Title", description: "Description ", publishDate: "14 Aug", imageUrl: URL(string: "https://picsum.photos/200")))
}
