//
//  AtriclesView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct AtriclesView: View {
    
    @State var articles: [Article] = []
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                if articles.count == 0 {
                    VStack(spacing: 10, content: {
                        Text("No articles added")
                            .font(.system(size: 28))
                        Text("Add an article with the plus icon above")
                            .font(.system(size: 17))
                    })
                } else {
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 8, content: {
                            ForEach(articles) { atricle in
                                HStack(content: {
                                    VStack(alignment: .leading, spacing: 4, content: {
                                        VStack {
                                            Text(atricle.sportType.rawValue)
                                                .padding(8)
                                                .font(.system(size: 11))
                                        }
                                        .background(Color.buttonColorActive)
                                        .clipShape(.rect(cornerRadius: 50))
                                        Text(atricle.title)
                                            .font(.system(size: 22))
                                            .lineLimit(2)
                                    })
                                    Spacer()
                                })
                                
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(Color.buttonColorActive.opacity(0.15))
                                .clipShape(.rect(cornerRadius: 30))
                                
                            }
                        })
                        .padding()
                    }
                    .padding(.top, 150)
                   
                }
                
            })
            .ignoresSafeArea()
            .toolbar(content: {
                NavigationLink {
                    NewArticles(articles: $articles)
                        .navigationTitle("New articles")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
            
            .navigationTitle("Articles")
        }
        .onAppear(perform: {
            articles.append(Article(title: "How Falcons stay on the top after 15 years", sportType: .football, text: "How Falcons stay on the top after 15 years", publisher: "dsfsdf sdfs", status: .sent))
            articles.append(Article(title: "How Falcons stay on the top after 15 years", sportType: .football, text: "How Falcons stay on the top after 15 years", publisher: "dsfsdf sdfs", status: .sent))
            articles.append(Article(title: "How Falcons stay on the top after 15 years", sportType: .football, text: "How Falcons stay on the top after 15 years", publisher: "dsfsdf sdfs", status: .sent))
            articles.append(Article(title: "How Falcons stay on the top after 15 years", sportType: .football, text: "How Falcons stay on the top after 15 years", publisher: "dsfsdf sdfs", status: .sent))
            articles.append(Article(title: "How Falcons stay on the top after 15 years", sportType: .football, text: "How Falcons stay on the top after 15 years", publisher: "dsfsdf sdfs", status: .sent))
            
        })
        

    }
}

#Preview {
    AtriclesView()
}
