//
//  FeedView.swift
//  SwiftUITikTokClone
//
//  Created by 김정민 on 7/11/25.
//

import SwiftUI
import AVKit

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPostion: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear {
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            player.play()
            print("### FeedView - onAppear - currentItem: \(player.currentItem)")
        }
        .scrollPosition(id: $scrollPostion)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPostion) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPostion == nil,
              let post = viewModel.posts.first,
              player.currentItem == nil
        else { return }
        
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
        player.play()
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        print("### FeedView - playVideoOnChangeOfScrollPosition - postId: \(postId)")
    }
}

#Preview {
    FeedView()
}
