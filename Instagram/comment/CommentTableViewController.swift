//
//  commentTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {
    var comments: [Comment]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension CommentTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CommentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! CommentTableViewCell
        let comment = comments![indexPath.row]

        cell.profileImage.image = comment.profileImage
        cell.profileName = comment.profileName
        cell.message = comment.message

        return cell
    }
}
