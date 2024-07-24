//
//  NewArticles.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct NewArticles: View {

//    @Binding var articles: [Article]
    @State var title = ""
    @State var articleText = ""
    @State var publisher = ""
    @State var correntSportType: Int?
    
    private let allSportTypes = Article.SportType.allCases
    
    var body: some View {
        
        ZStack {
            Color(.mainBackground)
                .ignoresSafeArea()
            VStack(content: {
                VStack(content: {
                        TextField("Headline", text: $title)
                            .padding()
                })
                .frame(height: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.white, lineWidth: 1)
                        .padding()
                )
                .padding(.top, -10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8, content: {
                        ForEach(Array(zip(allSportTypes.indices, allSportTypes)), id: \.0) { index, item in
                            VStack(alignment: .center, content: {
                                Button {
                                    correntSportType = index
                                } label: {
                                    ZStack(content: {
                                        if correntSportType != index {
                                            Color.buttonColorActive.opacity(0.5)
                                        } else {
                                            Color.buttonColorActive
                                        }
                                        Text(item.rawValue)
                                            .tint(.white)
                                            .font(.system(size: 11))
                                            .lineLimit(1)
                                            .padding(8)
                                            .fixedSize()

                                    })
                                    .frame(height: 21)
                                    
                                    
                                }

                                
                                    
                            })
                            .clipShape(.rect(cornerRadius: 50))
                            
                        }
                    })
                }
                
                .padding(.leading)
                
                HStack(content: {
                 Button(action: {
                        
                    }, label: {
                        Text("Status")
                        Text("︿")
                            .font(.custom("SF_Pro", size: 17))
                            .frame(height: 10, alignment: .bottom)
                    })
                 .tint(Color(UIColor.placeholderText))
                 .padding()
                    Spacer()
                })
                .frame(height: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.white, lineWidth: 1)
                        .padding()
                )
                .padding(.top, -10)
                
                VStack(content: {
                        TextField("Publisher", text: $publisher)
                            .padding()
                })
                .frame(height: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.white, lineWidth: 1)
                        .padding()
                )
                .padding(.top, -10)
                
                VStack(content: {
                    TextField("Article text", text: $articleText, axis: .vertical)

                        .padding()
                })
                .frame(minHeight: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.white, lineWidth: 1)
                        .padding()
                )
                .padding(.top, -10)
                Spacer()
            }).font(.custom("SFProText-Regular", size: 17))
        }
    }
}

#Preview {
    NewArticles()
}
