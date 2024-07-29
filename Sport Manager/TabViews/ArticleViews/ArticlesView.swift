//
//  ArticlesView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State var currentArticle: Article? = nil
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if coordinator.articles.isEmpty{
                    VStack(spacing: 10, content: {
                        Text("No articles added")
                            .font(.system(size: 28))
                        Text("Add an article with the plus icon above")
                            .font(.system(size: 17))
                    })
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
