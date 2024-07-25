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
                if coordinator.articles.count == 0 {
                    VStack(spacing: 10, content: {
                        Text("No articles added")
                            .font(.system(size: 28))
                        Text("Add an article with the plus icon above")
                            .font(.system(size: 17))
                    })
                } else {
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 8, content: {
                            ForEach(coordinator.articles) { article in
                                HStack(content: {
                                    VStack(alignment: .leading, spacing: 4, content: {
                                        VStack {
                                            Text(article.sportType.rawValue)
                                                .padding(8)
                                                .font(.system(size: 11))
                                        }
                                        .background(Color.buttonColorActive)
                                        .clipShape(.rect(cornerRadius: 50))
                                        Text(article.title)
                                            .font(.system(size: 22))
                                            .lineLimit(2)
                                    })
                                    Spacer()
                                })
                                .onTapGesture {
                                    currentArticle = article
                                }
                                .sheet(item: $currentArticle) { article in
                                    NavigationView {
                                        ArticleDescription(article: article)
                                            .navigationTitle(article.title)
                                            .navigationBarBackButtonHidden()
                                            .tint(Color.white)
                                            .toolbar(content: {
                                                ToolbarItem(placement: .topBarLeading) {
                                                    Button {
                                                        currentArticle = nil
                                                    }
                                                label: {
                                                    Image(systemName: "chevron.backward")
                                                        .fontWeight(.semibold)
                                                }
                                                }
                                            })
                                    }
                                    .tint(Color.white)
                                    
                                       
                                }
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(Color.buttonColorActive.opacity(0.15))
                                .clipShape(.rect(cornerRadius: 30))
                            }
                        })
                        .padding()
                    }
                }
            })
            .navigationTitle("Articles")
            .toolbar(content: {
                NavigationLink {
                    NewArticle(articles: $coordinator.articles)
                        .navigationTitle("New articles")
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
