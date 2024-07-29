//
//  ArticlesView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State var currentArticle: Article?
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if coordinator.articles.isEmpty{
                    IsEmptyView(currentItem: "article")
                } else {
                    AllArticlesView(articles: $coordinator.articles, currentArticle: $currentArticle)
                }
            })
            .navigationTitle("Articles")
            .toolbar(content: {
                NavigationLink {
                    NewArticle(articles: $coordinator.articles)
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
