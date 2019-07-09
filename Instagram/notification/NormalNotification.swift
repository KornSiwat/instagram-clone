//
//  Notification.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NormalNotification {
    let profileImage: UIImage
    let name: String
    let message: String
    let time: String

    init(profileImage: UIImage, name: String, message: String) {
        self.profileImage = profileImage
        self.name = name
        self.message = message
        self.time = "2d"
    }
}
