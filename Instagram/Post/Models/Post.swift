//
//  Post.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/2/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class Post {
    let profileImageUrl: URL
    let profileName: String
    let location: String
    var isLiked: Bool
    var likeCount: Int
    let caption: String
    var comments: [PostComment]
    let postImageUrl: URL

    init(profileImageUrl: URL,
         profileName: String,
         location: String = "",
         postImageUrl: URL,
         isLiked: Bool = false,
         likeCount: Int = 0,
         caption: String = "",
         comments: [PostComment] = []) {
        self.profileImageUrl = profileImageUrl
        self.profileName = profileName
        self.location = location
        self.postImageUrl = postImageUrl
        self.isLiked = isLiked
        self.likeCount = likeCount
        self.caption = caption
        self.comments = comments
    }
}
