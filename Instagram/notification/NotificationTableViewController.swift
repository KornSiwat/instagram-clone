//
//  NotificationTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    let notificationFacade = NotificationFacade()
    var notification: Notification?
    var onPostImagePress: OnPostImagePress?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupView()
    }
}

// MARK: - Setup
extension NotificationTableViewController {
    func setupView() {
        setupTableView()
    }

    func setupTableView() {
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.register(UINib.init(nibName: "NotificationSectionHeaderView", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "NotificationSectionHeaderView")
    }

    func setupData() {
        notification = notificationFacade.loadNotification()
    }
}

// MARK: - TableViewDataSource
extension NotificationTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification!.notifications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = self.notification!.notifications[indexPath.row]
        let cellIdentifier: String = {
            switch notification {
            case is NormalNotification:
                return "NormalNotificationCell"
            case is LikeNotification:
                return "LikeNotificationCell"
            case is FollowNotification:
                return "FollowNotificationCell"
            default:
                return ""
            }
        }()

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        configure(cell, at: indexPath)

        return cell
    }

    enum Header: Int {
        case today
        case thisWeek
        case thisMonth
        case earlier

        var text: String {
            switch self {
            case .today:
                return "Today"
            case .thisWeek:
                return "This Week"
            case .thisMonth:
                return "This Month"
            case .earlier:
                return "Earlier"
            }
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NotificationSectionHeaderView")
        as! NotificationSectionHeaderView

        headerView.header.text = Header(rawValue: section)!.text

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }

    func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        switch (cell, notification?.notifications[indexPath.row]) {
        case let (cell as NormalNotificationCell,
                  notification as NormalNotification):
            cell.configure(notification: notification)
        case let (cell as LikeNotificationCell,
                  notification as LikeNotification):
            cell.configure(notification: notification,
                           onPostImagePress: { self.onPostImagePress!(notification.likedPost) })
        case let (cell as FollowNotificationCell,
                  notification as FollowNotification):
            cell.configure(notification: notification)
        default:
            break
        }
    }
}

// MARK: - Configure
extension NotificationTableViewController {
    func configure(onPostImagePress: @escaping OnPostImagePress) {
        self.onPostImagePress = onPostImagePress
    }
}
