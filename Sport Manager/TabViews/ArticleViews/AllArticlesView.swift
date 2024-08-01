//
//  AllArticlesView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct AllArticlesView: View {
    
    @Environment(DataManager.self) private var dataManager
    @Binding var currentArticle: Article?
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 8, content: {
                ForEach(dataManager.articles) { article in
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
                    .contentShape(Rectangle())
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
}

//#Preview {
//    AllArticlesView()
//}
