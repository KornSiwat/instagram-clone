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
    let caption: String
    let postImageUrl: URL

    var comments: [PostComment]
    var likeCount: Int
    var isLiked: Bool
    
    init(_ post: ProfileResponse.Post) {
        profileImageUrl = post.profileImageUrl
        profileName = post.profileName
        location = post.location ?? ""
        postImageUrl = post.postImageUrl
        isLiked = post.isLiked ?? false
        likeCount = post.likeCount ?? 0
        caption = post.caption ?? ""
        comments = post.comments?.map(PostComment.init) ?? []
    }

    init(_ post: FeedResponse.Post) {
        profileImageUrl = post.profileImageUrl
        profileName = post.profileName
        location = post.location ?? ""
        postImageUrl = post.postImageUrl
        isLiked = post.isLiked ?? false
        likeCount = post.likeCount ?? 0
        caption = post.caption ?? ""
        comments = post.comments?.map(PostComment.init) ?? []
    }
    
    init(_ post: NotificationResponse.Post) {
        profileImageUrl = post.profileImageUrl
        profileName = post.profileName
        location = post.location ?? ""
        postImageUrl = post.postImageUrl
        isLiked = post.isLiked ?? false
        likeCount = post.likeCount ?? 0
        caption = post.caption ?? ""
        comments = post.comments?.map(PostComment.init) ?? []
    }
}
