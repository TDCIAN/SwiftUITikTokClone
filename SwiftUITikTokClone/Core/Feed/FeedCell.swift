//
//  FeedCell.swift
//  SwiftUITikTokClone
//
//  Created by 김정민 on 7/11/25.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.pink)
                .containerRelativeFrame([.horizontal, .vertical])
                .overlay {
                    Text("Post \(post)")
                        .foregroundStyle(.white)
                }
            
            VStack {
                Spacer()
                
                VStack {
                    Text("carlos.sainz")
                        .fontWeight(.semibold)
                    
                    Text("Rocket ship prepare for takeoff!!!")
                }
                .foregroundStyle(.white)
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    FeedCell(post: 2)
}
