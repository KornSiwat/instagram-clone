//
//  NotificationNormalMessage.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationFollowMessage {
    let profileImage: UIImage
    let name: String
    let message: String
    let time: String

    var isFollowing: Bool

    init(profileImage: UIImage, name: String, message: String, isFollowing: Bool) {
        self.profileImage = profileImage
        self.name = name
        self.message = message
        self.time = "12s"
        self.isFollowing = isFollowing
    }
}
