//
//  NotificationFollowingActivityTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationFollowingActivityTableViewController: UITableViewController {
    let notificationFacade = NotificationFacade()
    var notification: NotificationFeed?
    var onPostImagePress: OnPostImagePress?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
}

// MARK: - Setup
extension NotificationFollowingActivityTableViewController {
    func setupData() {
        notification = notificationFacade.loadNotification()
    }
}

// MARK: - TableViewDataSource
extension NotificationFollowingActivityTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification!.followingActivities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LikeNotificationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! NotificationLikeMessageTableViewCell
        let notification = self.notification!.followingActivities[indexPath.row]

        cell.configure(notification: notification,
                       onPostImagePress: { self.onPostImagePress!(notification.likedPost) })

        return cell
    }
}

// MARK: - Configure
extension NotificationFollowingActivityTableViewController {
    func configure( onPostImagePress: @escaping OnPostImagePress) {
        self.onPostImagePress = onPostImagePress
    }
}
