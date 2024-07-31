//
//  ArticlesView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @EnvironmentObject private var dataManager: DataManager
    @State private var currentArticle: Article?
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if dataManager.articles.isEmpty{
                    IsEmptyView(currentItem: "article")
                } else {
                    AllArticlesView(articles: $dataManager.articles, currentArticle: $currentArticle)
                }
            })
            .navigationTitle("Articles")
            .toolbar(content: {
                NavigationLink {
                    NewArticle(articles: $dataManager.articles)
                        .navigationTitle("New article")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
        }
        
    }
}

#Preview {
    ArticlesView()
}
