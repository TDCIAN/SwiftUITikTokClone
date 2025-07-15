//
//  FeedViewModel.swift
//  SwiftUITikTokClone
//
//  Created by 김정민 on 7/15/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    // Reference: https://gist.github.com/jsturgis/3b19447b304616f18657
    let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
    ]
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(
                id: NSUUID().uuidString,
                videoUrl: videoUrls[0]
            ),
            .init(
                id: NSUUID().uuidString,
                videoUrl: videoUrls[1]
            ),
            .init(
                id: NSUUID().uuidString,
                videoUrl: videoUrls[2]
            ),
            .init(
                id: NSUUID().uuidString,
                videoUrl: videoUrls[3]
            ),
            .init(
                id: NSUUID().uuidString,
                videoUrl: videoUrls[4]
            ),
            .init(
                id: NSUUID().uuidString,
                videoUrl: videoUrls[5]
            ),
        ]
    }
}
