//
//  Post.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/2/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class Post {
    var profileImage: UIImage
    var name: String
    var location: String
    var isLiked: Bool
    var likeCount: Int
    var caption: String
    var comments: [Comment]
    
    let postImage: UIImage

    init(profileImage: UIImage,
         name: String,
         location: String = "",
         postImage: UIImage,
         isLiked: Bool = false,
         likeCount: Int = 0,
         caption: String = "",
         comments: [Comment] = []) {
        self.profileImage = profileImage
        self.name = name
        self.location = location
        self.postImage = postImage
        self.isLiked = isLiked
        self.likeCount = likeCount
        self.caption = caption
        self.comments = comments
    }
}
