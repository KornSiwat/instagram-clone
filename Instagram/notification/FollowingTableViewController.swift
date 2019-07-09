//
//  FollowingTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class FollowingTableViewController: UITableViewController {
    let notifications: [LikeNotification] = [
        LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                         name: "mane",
                         message: "like your Post",
                         likedImage: UIImage(named: "mane")!),
        LikeNotification(profileImage: UIImage(named: "firminoProfile")!,
                         name: "bobby",
                         message: "like your post",
                         likedImage: UIImage(named: "firmino")!),
        LikeNotification(profileImage: UIImage(named: "firminoProfile")!,
                         name: "bobby",
                         message: "like your post",
                         likedImage: UIImage(named: "firmino")!),
        LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                         name: "mane",
                         message: "like your Post",
                         likedImage: UIImage(named: "mane")!),
        LikeNotification(profileImage: UIImage(named: "firminoProfile")!,
                         name: "bobby",
                         message: "like your post",
                         likedImage: UIImage(named: "firmino")!),
        LikeNotification(profileImage: UIImage(named: "firminoProfile")!,
                         name: "bobby",
                         message: "like your post",
                         likedImage: UIImage(named: "firmino")!),
        LikeNotification(profileImage: UIImage(named: "maneProfile")!,
                         name: "mane",
                         message: "like your Post",
                         likedImage: UIImage(named: "mane")!),
        LikeNotification(profileImage: UIImage(named: "firminoProfile")!,
                         name: "bobby",
                         message: "like your post",
                         likedImage: UIImage(named: "firmino")!),
        LikeNotification(profileImage: UIImage(named: "firminoProfile")!,
                         name: "bobby",
                         message: "like your post",
                         likedImage: UIImage(named: "firmino")!),
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
        
        cell.profileImage.image = notification.profileImage
        cell.name = notification.name
        cell.message = notification.message
        cell.likedImage.image = notification.likedImage
        
        return cell
    }
}
