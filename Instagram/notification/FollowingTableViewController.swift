//
//  FollowingTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class FollowingTableViewController: UITableViewController {
    let notifications: [Notification] = [
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
        Notification(image: UIImage(named: "salahProfile")!,
                     name: "mohamed_salaj",
                     message: "like kkornsw post"),
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
        let cellIdentifier = "NotificationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! NotificationTableViewCell
        let notification = notifications[indexPath.row]
        
        cell.profileImage.image = notification.image
        cell.name = notification.name
        cell.detail = notification.message
        
        return cell
    }
}
