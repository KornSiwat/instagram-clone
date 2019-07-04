//
//  ProfileTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    let selfInfo = UserInfo(profileImage: UIImage(named: "salahProfile")!,
                            name: "kkornsw",
                            biography: "Liverpool Big Fan",
                            postCount: 59,
                            followerCount: 512,
                            followingCount: 203)
    let selfHighlights = [
        Highlight(image: UIImage(named: "maneProfile")!,
                  name: "mane"),
        Highlight(image: UIImage(named: "firminoProfile")!,
                  name: "firmino"),
        Highlight(image: UIImage(named: "liverpoolProfile")!,
                  name: "liverpool")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


}

// MARK: - Table view data source
extension ProfileTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellIdentifier = "ProfileDetailCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProfileDetailTableViewCell

            cell.userInfo = selfInfo

            return cell
        default:
            let cellIdentifier = "HighlightCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HighlightTableViewCell

            cell.highlights = selfHighlights

            return cell
        }
    }
}
