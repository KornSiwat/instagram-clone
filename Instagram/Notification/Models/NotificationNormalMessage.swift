//
//  NotificationNormalMessage.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationNormalMessage {
    let profileImageUrl: URL
    let name: String
    let message: String
    let time: String

    init(_ notification: NotificationResponse.Notification) {
        profileImageUrl = notification.profileImageUrl
        name = notification.name
        message = notification.message
        time = "2d"
    }
}
