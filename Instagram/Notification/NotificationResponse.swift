//
//  NotificationResponse.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/26/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import Foundation

struct NotificationResponse: Decodable {
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
    
    struct SelfInfo: Decodable {
        let profileImageUrl: URL
        let name: String
        let biography: String
        let postCount: Int
        let followerCount: Int
        let followingCount: Int
    }
    
    struct Notification: Decodable {
        let type: String
        let profileImageUrl: URL
        let name: String
        let message: String
        let isFollowing: Bool?
        let likedPost: Post?
    }
    
    struct FollowingActivity: Decodable {
        let type: String
        let profileImageUrl: URL
        let name: String
        let message: String
        let likedPost: Post?
    }
    
    let selfInfo: SelfInfo
    let notifications: [Notification]
    let followingActivities: [FollowingActivity]
}
