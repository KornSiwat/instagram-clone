//
//  FollowingNotificationFacade.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationFacade {
    func loadNotification() -> NotificationFeed {
        return NotificationFeed(selfInfo: loadSelfInfo(),
                            followingActivities: loadFollowingActivities(),
                            notifications: loadNotifications())
    }
}

// MARK: - Load SelfInfo
extension NotificationFacade {
    func loadSelfInfo() -> UserInfo {
        return UserInfo(profileImage: UIImage(named: "salahProfile")!,
                        name: "kkornsw")
    }
}

// MARK: - Load Notification
private extension NotificationFacade {
    func loadNotifications() -> [Any] {
        return [
            NotificationNormalMessage(profileImage: UIImage(named: "salahProfile")!,
                               name: "siwat",
                               message: "turned on countdown remainders for \"go to Japan\""),
            NotificationFollowMessage(profileImage: UIImage(named: "maneProfile")!,
                               name: "mane",
                               message: "started Following You",
                               isFollowing: true),
            NotificationLikeMessage(profileImage: UIImage(named: "salahProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            NotificationFollowMessage(profileImage: UIImage(named: "maneProfile")!,
                               name: "mane",
                               message: "started Following You",
                               isFollowing: false),
            NotificationFollowMessage(profileImage: UIImage(named: "maneProfile")!,
                               name: "mane",
                               message: "started Following You",
                               isFollowing: true)
        ]
    }
}

// MARK: - Load FollowingActivities
private extension NotificationFacade {
    func loadFollowingActivities() -> [NotificationLikeMessage] {
        return [
            NotificationLikeMessage(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            NotificationLikeMessage(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            NotificationLikeMessage(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            NotificationLikeMessage(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            NotificationLikeMessage(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
        ]
    }
}
