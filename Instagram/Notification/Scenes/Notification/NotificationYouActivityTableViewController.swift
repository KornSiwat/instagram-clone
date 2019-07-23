//
//  NotificationYouActivityTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationYouActivityTableViewController: UITableViewController {
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    let notificationFacade = NotificationFacade()
    var notification: NotificationFeed? {
        didSet {
            tableView.reloadData()
        }
    }
    var onPostImagePress: OnPostImagePress?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupView()
    }
}

// MARK: - Setup
extension NotificationYouActivityTableViewController {
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
        loadNotification()
    }
    
    func loadNotification() {
        loadingIndicatorView.startAnimating()
        
        notificationFacade.loadNotificationFeed(completion: { (notificationFeed, error) in
            self.loadingIndicatorView.stopAnimating()
            self.tableView.refreshControl!.endRefreshing()
            
            guard let notificationFeed = notificationFeed else {
                return
            }
            
            self.notification = notificationFeed
        })
    }
}

// MARK: - Update
extension NotificationYouActivityTableViewController {
    @IBAction func refresh(_ sender: UIRefreshControl) {
        loadNotification()
    }
}

// MARK: - TableViewDataSource
extension NotificationYouActivityTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard notification != nil else { return 0 }
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notification = notification else { return 0 }

        return notification.notifications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = self.notification!.notifications[indexPath.row]
        let cellIdentifier: String = {
            switch notification {
            case is NotificationNormalMessage:
                return "NormalNotificationCell"
            case is NotificationLikeMessage:
                return "LikeNotificationCell"
            case is NotificationFollowMessage:
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
        case let (cell as NotificationNormalMessageTableViewCell,
                  notification as NotificationNormalMessage):
            cell.configure(notification: notification)
        case let (cell as NotificationLikeMessageTableViewCell,
                  notification as NotificationLikeMessage):
            cell.configure(notification: notification,
                           onPostImagePress: { self.onPostImagePress!(self.notification!.selfInfo,
                                                                      notification.likedPost) })
        case let (cell as NotificationFollowMessageTableViewCell,
                  notification as NotificationFollowMessage):
            cell.configure(notification: notification)
        default:
            break
        }
    }
}

// MARK: - Configure
extension NotificationYouActivityTableViewController {
    func configure(onPostImagePress: @escaping OnPostImagePress) {
        self.onPostImagePress = onPostImagePress
    }
}
