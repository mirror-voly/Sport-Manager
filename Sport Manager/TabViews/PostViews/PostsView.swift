//
//  PostsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct PostsView: View {
    
    @EnvironmentObject private var dataManager: DataManager
    @State private var currentPost: Post?
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if dataManager.posts.isEmpty {
                    IsEmptyView(currentItem: "post")
                } else {
                    AllPostsView(posts: $dataManager.posts, currentPost: $currentPost)
                }
            })
            .navigationTitle("Posts")
            .toolbar(content: {
                NavigationLink {
                    NewPostView(posts: $dataManager.posts)
                        .navigationTitle("New post")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
        }
        
    }
}

#Preview {
    PostsView()
}
