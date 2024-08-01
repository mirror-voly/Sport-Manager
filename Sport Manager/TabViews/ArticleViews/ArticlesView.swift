//
//  ArticlesView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @Environment(DataManager.self) private var dataManager
    @State private var currentArticle: Article?
    
    var body: some View {

        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if dataManager.articles.isEmpty{
                    IsEmptyView(currentItem: "article")
                } else {
                    AllArticlesView(currentArticle: $currentArticle)
                }
            })
            .navigationTitle("Articles")
            .toolbar(content: {
                NavigationLink {
                    NewArticle()
                        .navigationTitle("New article")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
        }
        
    }
}

//#Preview {
//    ArticlesView()
//}
