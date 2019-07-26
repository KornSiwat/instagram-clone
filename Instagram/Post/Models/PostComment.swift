//
//  PostComment.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class PostComment {
    let profileName: String
    let profileImageUrl: URL
    let message: String
    
    init(profileName: String, profileImageUrl: URL, message: String) {
        self.profileName = profileName
        self.profileImageUrl = profileImageUrl
        self.message = message
    }
    
    init(_ comment: ProfileResponse.Post.PostComment) {
        profileName = comment.profileName
        profileImageUrl = comment.profileImageUrl
        message = comment.message
    }

    init(_ comment: FeedResponse.Post.PostComment) {
        profileName = comment.profileName
        profileImageUrl = comment.profileImageUrl
        message = comment.message
    }
    
    init(_ comment: NotificationResponse.Post.PostComment) {
        profileName = comment.profileName
        profileImageUrl = comment.profileImageUrl
        message = comment.message
    }
}
