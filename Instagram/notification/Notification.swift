//
//  Notification.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

struct Notification {
    let selfInfo: UserInfo
    let followingActivities: [LikeNotification]
    let notifications: [Any]
}
