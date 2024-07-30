//
//  NewPostView.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct NewPostView: View {
    
    @Binding var posts: [Post]
    @EnvironmentObject private var dataManager: DataManager
    @State var allSet = false
    @State var title = ""
    @State var text = ""

    @Environment(\.dismiss) var dismis
      
    func isAllFieldsSet() {
        if  !title.isEmpty && !text.isEmpty {
            allSet = true
        } else {
            allSet = false
        }
    }
    
    private func addNew() {
        let newPost = Post(title: title, text: text, date: Date())
        posts.append(newPost)
        dataManager.savePosts(posts: posts)
    }
    
var body: some View {
    GeometryReader(content: { geometry in
        ZStack {
            Color(.mainBackground)
                .ignoresSafeArea()
            
            VStack(spacing: -20, content: {
                VStack(content: {
                    TextField("Name post", text: $title)
                        .tint(.mainPlaceholder)
                        .onChange(of: title, { _, _ in
                            isAllFieldsSet()
                        })
                        .padding()
                })
                .frame(height: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.mainPlaceholder, lineWidth: 1)
                        .padding()
                )
                
                VStack(content: {
                    TextField("Text", text: $text, axis: .vertical)
                        .fixedSize(horizontal: false, vertical: true)
                        .tint(.mainPlaceholder)
                        .onChange(of: text, { _, _ in
                            isAllFieldsSet()
                        })
                        .ignoresSafeArea()
                        .padding()
                })
                .ignoresSafeArea()
                .frame(minHeight: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.mainPlaceholder, lineWidth: 1)
                        .padding()
                        .ignoresSafeArea()
                )
                
                Spacer()
                
                
            })
            VStack(content: {
                Spacer()
                Button(action: {
                    addNew()
                    dismis()
                }, label: {
                    if allSet {
                        Text("Create")
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .tint(Color.white)
                            .background(Color.buttonColorActive)
                            .clipShape(.rect(cornerRadius: 20))
                    } else {
                        Text("Create")
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .tint(Color.white.opacity(0.5))
                            .background(Color.buttonColorActive.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 20))
                    }
                })
                .disabled(!allSet)
                .padding()
                .font(.system(size: 17))
            })
        }
    })

}
}

#Preview {
    NewPostView(posts: .constant([]))
}
