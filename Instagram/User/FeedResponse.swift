//
//  FeedResponse.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/26/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import Foundation

struct FeedResponse: Decodable {
    struct SelfInfo: Decodable {
        let profileImageUrl: URL
        let name: String
        let biography: String
        let postCount: Int
        let followerCount: Int
        let followingCount: Int
    }
    
    struct Story: Decodable {
        let previewImageUrl: URL
        let name: String
    }
    
    struct Post: Decodable {
        struct PostComment: Decodable {
            let profileName: String
            let profileImageUrl: URL
            let message: String
        }
        
        let profileImageUrl: URL
        let profileName: String
        let location: String?
        let isLiked: Bool?
        let likeCount: Int?
        let caption: String?
        let comments: [PostComment]?
        let postImageUrl: URL
    }
    
    let selfInfo: SelfInfo
    let stories: [Story]
    let posts: [Post]
}
