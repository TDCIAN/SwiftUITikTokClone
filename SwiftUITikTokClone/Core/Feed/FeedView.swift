//
//  FeedView.swift
//  SwiftUITikTokClone
//
//  Created by 김정민 on 7/11/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0 ..< 10) { post in
                    FeedCell(post: post)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView()
}
