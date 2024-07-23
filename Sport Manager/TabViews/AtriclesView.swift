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
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                    })
                }
                
            })
            .ignoresSafeArea()
            .toolbar(content: {
                NavigationLink {
                    NewArticles()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
            
            .navigationTitle("Articles")
        }
        

    }
}

#Preview {
    AtriclesView()
}
