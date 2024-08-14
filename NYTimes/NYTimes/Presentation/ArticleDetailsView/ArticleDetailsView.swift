//
//  ArticleDetailsView.swift
//  NYTimes
//
//  Created by Amaan Ullah on 14/08/2024.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    var viewModel: ArticleDetailsViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(viewModel.publishedBy)
                            .font(.subheadline)
                        Text(viewModel.publishDate)
                            .font(.caption)
                            .italic()
                            .foregroundColor(.accentColor)
                    }
                    
                    Text(viewModel.title)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .padding(.top)
                    
                    Text(viewModel.description)
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.primary)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                AsyncImage(url: viewModel.imageUrl) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                        .frame(width: proxy.size.width, height: proxy.size.width)
                }
                .frame(width: proxy.size.width)
                .aspectRatio(contentMode: .fill)
                
                if let caption = viewModel.imageCaption {
                    Text(caption)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 8)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ArticleDetailsView(viewModel: ArticleDetailsViewModel(id: 1, title: "Title", description: "Description ", publishDate: "14 Aug", publishedBy: "Author", imageUrl: URL(string: "https://picsum.photos/200"), imageCaption: "asdfa"))
}
