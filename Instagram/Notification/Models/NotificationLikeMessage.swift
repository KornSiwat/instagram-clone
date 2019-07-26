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

    init(_ notification: NotificationResponse.Notification) {
        profileImageUrl = notification.profileImageUrl
        name = notification.name
        message = notification.message
        time = "2d"
        likedPost = Post(notification.likedPost!)
    }
    
    init(_ activity: NotificationResponse.FollowingActivity) {
        profileImageUrl = activity.profileImageUrl
        name = activity.name
        message = activity.message
        time = "2d"
        likedPost = Post(activity.likedPost!)
    }
}
