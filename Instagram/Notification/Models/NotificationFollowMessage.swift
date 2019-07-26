//
//  NotificationNormalMessage.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationFollowMessage {
    let profileImageUrl: URL
    let name: String
    let message: String
    let time: String

    var isFollowing: Bool

    init(_ notification: NotificationResponse.Notification) {
        profileImageUrl = notification.profileImageUrl
        name = notification.name
        message = notification.message
        time = "12s"
        isFollowing = notification.isFollowing!
    }
}
