//
//  NewPostView.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct NewPostView: View {
    
    @Environment(DataManager.self) private var dataManager
    @State private var allSet = false
    @State private var title = ""
    @State private var text = ""

    @Environment(\.dismiss) private var dismis
      
    private func isAllFieldsSet() {
        if  !title.isEmpty && !text.isEmpty {
            allSet = true
        } else {
            allSet = false
        }
    }
    
    private func addNew() {
        let newPost = Post(title: title, text: text, date: Date())
        dataManager.appendItem(newPost)
    }
    
    var body: some View {
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
                            .tint(.mainPlaceholder)
                            .onChange(of: text, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .ignoresSafeArea()
                    .frame(minHeight: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                    
                    Spacer()
                    
                    VStack(content: {
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
                    .padding(.top)
                })
               
            }
        .onTapGesture(perform: {
            hideKeyboard()
        })
        
    }
}

//#Preview {
//    NewPostView(posts: .constant([]))
//}
