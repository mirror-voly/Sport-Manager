//
//  PostsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct PostsView: View {
    
    @Environment(DataManager.self) private var dataManager
    @State private var currentPost: Post?
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if dataManager.posts.isEmpty {
                    IsEmptyView(currentItem: "post")
                } else {
                    AllPostsView(currentPost: $currentPost)
                }
            })
            .navigationTitle("Posts")
            .toolbar(content: {
                NavigationLink {
                    NewPostView()
                        .navigationTitle("New post")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
        }
        
    }
}

//#Preview {
//    PostsView()
//}
