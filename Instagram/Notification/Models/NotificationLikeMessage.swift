//
//  NotificationLikeMessage.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationLikeMessage {
    let profileImage: UIImage
    let name: String
    let message: String
    let likedPost: Post
    let time: String

    init(profileImage: UIImage, name: String, message: String, likedPost: Post) {
        self.profileImage = profileImage
        self.name = name
        self.message = message
        self.time = "2d"
        self.likedPost = likedPost
    }
}
