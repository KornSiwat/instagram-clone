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

    init(profileImageUrl: URL, name: String, message: String) {
        self.profileImageUrl = profileImageUrl
        self.name = name
        self.message = message
        self.time = "2d"
    }
}
