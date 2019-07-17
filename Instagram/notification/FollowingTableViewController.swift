//
//  FollowingTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class FollowingTableViewController: UITableViewController {
    let notificationFacade = NotificationFacade()
    var notification: Notification?
    var onPostImagePress: ((Post) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
}

// MARK: - Setup
extension FollowingTableViewController {
    func setupData() {
        notification = notificationFacade.loadNotification()
    }
}

// MARK: - TableViewDataSource
extension FollowingTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification!.followingActivities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LikeNotificationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! LikeNotificationCell
        let notification = self.notification!.followingActivities[indexPath.row]

        cell.configure(notification: notification,
                       onPostImagePress: { self.onPostImagePress!(notification.likedPost) })

        return cell
    }
}

// MARK: - Configure
extension FollowingTableViewController {
    func configure( onPostImagePress: @escaping (Post) -> Void) {
        self.onPostImagePress = onPostImagePress
    }
}
