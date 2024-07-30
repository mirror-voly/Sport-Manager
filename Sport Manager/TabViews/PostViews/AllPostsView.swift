//
//  AllPostsView.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct AllPostsView: View {
    
    @Binding var posts: [Post]
    @Binding var currentPost: Post?
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 12, content: {
                ForEach(posts, id: \.self) { post in
                        VStack(alignment: .leading, content: {
                            VStack(alignment: .leading, spacing: 4, content: {
                                let formatedDate = formatDate(date: post.date)
                                Text(formatedDate)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .colorMultiply(.mainPlaceholder)
                                    .font(.system(size: 13))
                                Text(post.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 17))
                                    .lineLimit(nil)
                            })
                            .padding(16)
                        })
                        .background(Color.cardBackGround)
                        .contentShape(Rectangle())
                        .clipShape(.rect(cornerRadius: 30))
                        .onTapGesture {
                            currentPost = post
                        }
                    .sheet(item: $currentPost) { post in
                        NavigationView {
                            PostDescription(post: post)
                                .navigationBarBackButtonHidden()
                                .tint(Color.white)
                        }
                        .tint(Color.white)
                    }
                }
            })
            .padding()
        }
    }
}

#Preview {
    AllPostsView(posts: .constant([]), currentPost: .constant(Post(title: "sdfsd", text: "sddsf", date: Date())))
}
