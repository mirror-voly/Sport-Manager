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
    let allStatus = Article.Status.AllCases()
    
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
                
                VStack(content: {
                    
                    Button(action: {
                        
                    }, label: {
                        Label("Status", image: .docFill)
                    })
                        
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
                        TextField("Article text", text: $articleText)
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
                Spacer()
            }).font(.system(size: 17))
        }
    }
}

#Preview {
    NewArticles()
}
