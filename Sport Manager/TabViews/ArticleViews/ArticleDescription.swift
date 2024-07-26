//
//  ArticleDescription.swift
//  Sport Manager
//
//  Created by mix on 24.07.2024.
//

import SwiftUI

struct ArticleDescription: View {
    
    var article: Article
    
    var body: some View {
        ZStack(content: {
            Color.mainBackground
                .ignoresSafeArea()
            VStack(alignment: .leading, content: {
                VStack(alignment: .leading,content: {
                    HStack(content: {
                        Text(article.status.rawValue)
                            .font(.system(size: 17))
                        Spacer()
                        VStack {
                            Text(article.sportType.rawValue)
                                .padding(8)
                                .font(.system(size: 11))
                        }
                        .background(Color.buttonColorActive)
                        .clipShape(.rect(cornerRadius: 50))
                    })
                    Text(article.publisher)
                        .colorMultiply(Color(UIColor.placeholderText))
                        .font(.system(size: 17))
                })
                
                Text(article.text)
                    .font(.system(size: 17))
                    .padding(.top)
                Spacer()
            })
            .padding()
        })
        
        
    }
}

#Preview {
    ArticleDescription(article: (Article(title: "How Falcons stay on the top after 15 years", sportType: .football, text: "erg sjdfgl jsdlfjglsuerhiugh sldvxcvbxcvbxcvb xcb cvvbx vbxcvbx xcvb xcvb xcvbx cbfgbfb th thrt dfg t rtg rtg r jn l mlkm km  jn khb jjn mkhb j bmkgv kjkmhb nmk nm jhb jh bnkjh bmkj hbj mb bhfgklsj hfgkheri gjzzdfjkg", publisher: "Post on Facebook", status: .sent)))
}
