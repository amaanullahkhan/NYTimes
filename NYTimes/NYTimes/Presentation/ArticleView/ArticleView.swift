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
        
        HStack {
            
            AsyncImage(url: viewModel.imageUrl) { imagePhase in
                imagePhase.image?.resizable()
            }
            .frame(width: 120, height: 120)
            
            VStack {                
                Text(viewModel.title)
                Text(viewModel.description)
                Text(viewModel.publishDate)
            }
        }
        
    }
}
