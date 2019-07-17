//
//  FollowingNotificationFacade.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationFacade {
    func loadNotification() -> Notification {
        return Notification(selfInfo: loadSelfInfo(),
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
            NormalNotification(profileImage: UIImage(named: "salahProfile")!,
                               name: "siwat",
                               message: "turned on countdown remainders for \"go to Japan\""),
            FollowNotification(profileImage: UIImage(named: "maneProfile")!,
                               name: "mane",
                               message: "started Following You",
                               isFollowing: true),
            LikeNotification(profileImage: UIImage(named: "salahProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            FollowNotification(profileImage: UIImage(named: "maneProfile")!,
                               name: "mane",
                               message: "started Following You",
                               isFollowing: false),
            FollowNotification(profileImage: UIImage(named: "maneProfile")!,
                               name: "mane",
                               message: "started Following You",
                               isFollowing: true)
        ]
    }
}

// MARK: - Load FollowingActivities
private extension NotificationFacade {
    func loadFollowingActivities() -> [LikeNotification] {
        return [
            LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
            LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                             name: "mane",
                             message: "like your Post",
                             likedPost: Post(profileImage: UIImage(named: "salahProfile")!,
                                             name: "kkornsw",
                                             postImage: UIImage(named: "mane")!)),
        ]
    }
}
