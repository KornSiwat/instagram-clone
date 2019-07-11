//
//  NotificationTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    var selfInfo: UserInfo?
    var onPostImagePress: ((Post) -> (() -> Void))?

    let notifications: [Any] = [
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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.register(UINib.init(nibName: "NotificationSectionHeaderView", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "NotificationSectionHeaderView")
    }
}

// MARK: - TableViewDataSource
extension NotificationTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = notifications[indexPath.row]

        switch notification {
        case let notification as NormalNotification:
            let cellIdentifier = "NormalNotificationCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! NormalNotificationCell

            cell.profileImage.image = notification.profileImage
            cell.name = notification.name
            cell.message = notification.message

            return cell
        case let notification as LikeNotification:
            let cellIdentifier = "LikeNotificationCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! LikeNotificationCell

            cell.config(profileImage: notification.profileImage,
                        name: notification.name,
                        message: notification.message,
                        post: notification.likedPost,
                        time: notification.time)

            cell.onPostImagePress = onPostImagePress!(notification.likedPost)

            return cell
        case let notification as FollowNotification:
            let cellIdentifier = "FollowNotificationCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! FollowNotificationCell

            cell.profileImage.image = notification.profileImage
            cell.name = notification.name
            cell.message = notification.message
            cell.isFollowing = notification.isFollowing

            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NotificationSectionHeaderView")
        as! NotificationSectionHeaderView

        switch section {
        case 0:
            headerView.header.text = "Today"
        case 1:
            headerView.header.text = "This Week"
        case 2:
            headerView.header.text = "This Month"
        default:
            headerView.header.text = "Earlier"
        }

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}


