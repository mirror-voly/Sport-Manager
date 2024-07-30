//
//  PostDescription.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct PostDescription: View {

    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }

    var post: Post
    
    var body: some View {
        ZStack(content: {
            Color.mainBackground
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(alignment: .leading, content: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text(formatDate(date: post.date))
                            .colorMultiply(Color(UIColor.placeholderText))
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(post.title)
                            .bold()
                            .font(.system(size: 22))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    })
                    
                    Text(post.text)
                        .colorMultiply(Color.white.opacity(0.9))
                        .font(.system(size: 17))
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                })
                .padding()
            }
            
        })
        
        
        
    }
}

#Preview {
    PostDescription(post: Post(title: "Losgsdfg dsfg sdf sdfg sdfg sfdggfds gsdf gs dfgsd fsdfg sfg sdfg sdfg sfhhyl", text: "What dfsdf sdf sdf sdf sdf dsf sd fsdf sdf sdf sd fs fsd fsdf sdfsdf sd fsd fsd sd fsd fsdf ", date: Date()))
}
