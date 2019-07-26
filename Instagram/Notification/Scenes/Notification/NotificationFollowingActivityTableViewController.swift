//
//  NotificationFollowingActivityTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import PromiseKit

class NotificationFollowingActivityTableViewController: UITableViewController {
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
    }
}

// MARK: - Setup
extension NotificationFollowingActivityTableViewController {
    func setupData() {
        setupNotificationData()
    }

    func setupNotificationData() {
        loadingIndicatorView.startAnimating()
        loadNotification().finally {
            self.loadingIndicatorView.stopAnimating()
        }
    }

    func loadNotification() -> PMKFinalizer {
        return notificationFacade.loadNotificationFeedPMK()
            .done { self.notification = $0 }
            .catch { error in print(error) } }
}

// MARK: - Update
extension NotificationFollowingActivityTableViewController {
    @IBAction func refresh(_ sender: UIRefreshControl) {
        loadNotification().finally {
            self.tableView.refreshControl!.endRefreshing()
        }
    }
}

// MARK: - TableViewDataSource
extension NotificationFollowingActivityTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notification = notification else {
            return 0
        }

        return notification.followingActivities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LikeNotificationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! NotificationLikeMessageTableViewCell
        let notification = self.notification!.followingActivities[indexPath.row]

        cell.configure(notification: notification,
                       onPostImagePress: { self.onPostImagePress!(self.notification!.selfInfo
                                                                  , notification.likedPost) })

        return cell
    }
}

// MARK: - Configure
extension NotificationFollowingActivityTableViewController {
    func configure(onPostImagePress: @escaping OnPostImagePress) {
        self.onPostImagePress = onPostImagePress
    }
}
