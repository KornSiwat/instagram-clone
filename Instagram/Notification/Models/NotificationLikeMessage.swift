//
//  NotificationLikeMessage.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationLikeMessage {
    let profileImageUrl: URL
    let name: String
    let message: String
    let likedPost: Post
    let time: String

    init(profileImageUrl: URL, name: String, message: String, likedPost: Post) {
        self.profileImageUrl = profileImageUrl
        self.name = name
        self.message = message
        self.time = "2d"
        self.likedPost = likedPost
    }
}
