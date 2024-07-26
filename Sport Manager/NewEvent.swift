//
//  NewEvent.swift
//  Sport Manager
//
//  Created by mix on 26.07.2024.
//

import SwiftUI

struct NewEvent: View {
//    
    @Binding var events: [Event]
//    @State var title = ""
//    @State var articleText = ""
//    @State var publisher = ""
//    @State var correntSportType: Int?
//    @State var correntStatus: Int?
//    @State var allSet = false
//    
//    let dataManager = DataManager()
//    
//    @Environment(\.dismiss) var dismis
//    
//    private let allSportTypes = Article.SportType.allCases
//    private let allStatus = Article.Status.allCases
//    
//    func isAllFieldsSet() {
//        if !title.isEmpty && !articleText.isEmpty && !publisher.isEmpty && correntSportType != nil {
//            allSet = true
//        } else {
//            allSet = false
//        }
//    }
//    
    var body: some View {
//        GeometryReader(content: { geometry in
        ZStack {
            Color(.mainBackground)
//                .ignoresSafeArea()
//            VStack(content: {
//                VStack(content: {
//                        TextField("Headline", text: $title)
//                        .onChange(of: title, { _, _ in
//                            isAllFieldsSet()
//                        })
//                            .padding()
//                })
//                .frame(height: 62)
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
//                        .stroke(.white, lineWidth: 1)
//                        .padding()
//                )
//                .padding(.top, -10)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 8, content: {
//                        ForEach(Array(zip(allSportTypes.indices, allSportTypes)), id: \.0) { index, item in
//                            VStack(alignment: .center, content: {
//                                Button {
//                                    if correntSportType == index {
//                                        correntSportType = nil
//                                    } else {
//                                        correntSportType = index
//                                    }
//                                    
//                                    isAllFieldsSet()
//                                } label: {
//                                    ZStack(content: {
//                                        if correntSportType != index {
//                                            Color.buttonColorActive.opacity(0.5)
//                                        } else {
//                                            Color.buttonColorActive
//                                        }
//                                        Text(item.rawValue)
//                                            .tint(.white)
//                                            .font(.system(size: 11))
//                                            .lineLimit(1)
//                                            .padding(8)
//                                            .fixedSize()
//                                    })
//                                    .frame(height: 21)
//                                }
//                            })
//                            .clipShape(.rect(cornerRadius: 50))
//                        }
//                    })
//                }
//                .padding(.leading)
//                
//                HStack(alignment: .center, content: {
//                    Menu {
//                        ForEach(Array(zip(allStatus.indices, allStatus)), id: \.0) { index, item in
//                            Button(item.rawValue) {
//                                correntStatus = index
//                                isAllFieldsSet()
//                            }
//                        }
//                    } label: {
//                        HStack(content: {
//                            if correntStatus != nil {
//                                HStack(content: {
//                                    Text(allStatus[correntStatus!].rawValue)
//                                    Image(systemName: "triangle")
//                                        .font(.system(size: 10))
//                                        
//                                })
//                                .tint(Color.white)
//                            } else {
//                                HStack(content: {
//                                    Text("Status")
//                                    Image(systemName: "triangle")
//                                        .rotationEffect(Angle(degrees: 180))
//                                        .font(.system(size: 10))
//                                })
//                                .tint(Color(UIColor.placeholderText))
//                            }
//                        })
//                        .padding()
//                        .font(.system(size: 17))
//                    }
//                        Spacer()
//                })
//                
//                .frame(height: 62)
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
//                        .stroke(.white, lineWidth: 1)
//                        .padding()
//                )
//                
//                VStack(content: {
//                        TextField("Publisher", text: $publisher)
//                        .onChange(of: publisher, { _, _ in
//                            isAllFieldsSet()
//                        })
//                        .padding()
//                })
//                .frame(height: 62)
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
//                        .stroke(.white, lineWidth: 1)
//                        .padding()
//                )
//                .padding(.top, -10)
//                
//                VStack(content: {
//                    TextField("Article text", text: $articleText, axis: .vertical)
//                        .onChange(of: articleText, { _, _ in
//                            isAllFieldsSet()
//                        })
//                        .padding()
//                })
//                .frame(minHeight: 62)
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
//                        .stroke(.white, lineWidth: 1)
//                        .padding()
//                )
//                .padding(.top, -10)
//                Spacer()
//                Button(action: {
//                    let newArticle = Article(title: title, sportType: allSportTypes[correntSportType!], text: articleText, publisher: publisher, status: allStatus[correntStatus!])
//                    articles.append(newArticle)
//                    dataManager.saveArticles(articles: articles)
//                    dismis()
//                }, label: {
//                            if allSet {
//                                Text("Add")
//                                    .padding(20)
//                                    .frame(maxWidth: .infinity)
//                                    .tint(Color.white)
//                                    .background(Color.buttonColorActive)
//                                    .clipShape(.rect(cornerRadius: 20))
//                            } else {
//                                Text("Add")
//                                    .padding(20)
//                                    .frame(maxWidth: .infinity)
//                                    .tint(Color.white.opacity(0.5))
//                                    .background(Color.buttonColorActive.opacity(0.5))
//                                    .clipShape(.rect(cornerRadius: 20))
//                            }
//                        })
//                        .disabled(!allSet)
//                        .padding()
//                                
//            })
//            .font(.system(size: 17))
        }
//        })
    }
}

//#Preview {
//    NewEvent()
//}
