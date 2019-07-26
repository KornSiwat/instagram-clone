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
    
    init(response: NotificationResponse) {
        selfInfo = UserInfo(response.selfInfo)
        
        notifications = response.notifications.map { (notification: NotificationResponse.Notification) in
            switch notification.type {
            case "Normal":
                return NotificationNormalMessage(notification)
            case "Follow":
                return NotificationFollowMessage(notification)
            case "Like":
                return NotificationLikeMessage(notification)
            default:
                return 1
            }
        }
        
        followingActivities = response.followingActivities.map(NotificationLikeMessage.init)
    }
}
