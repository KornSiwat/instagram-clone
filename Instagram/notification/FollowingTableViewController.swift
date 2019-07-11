//
//  FollowingTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class FollowingTableViewController: UITableViewController {
    var selfInfo: UserInfo?
    var onPostImagePress: ((Post) -> (() -> Void))?

    let notifications: [LikeNotification] = [
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


    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableViewDataSource
extension FollowingTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LikeNotificationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! LikeNotificationCell
        let notification = notifications[indexPath.row]

        cell.config(profileImage: notification.profileImage,
                    name: notification.name,
                    message: notification.message,
                    post: notification.likedPost,
                    time: notification.time)

        cell.onPostImagePress = onPostImagePress!(notification.likedPost)

        return cell
    }
}
