//
//  NotificationFeed.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

struct NotificationFeed {
    let selfInfo: UserInfo
    let followingActivities: [NotificationLikeMessage]
    let notifications: [Any]
}
