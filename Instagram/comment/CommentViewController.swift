//
//  CommentViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    var comments: [Comment]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UIViewControllerDelegate
extension CommentViewController: UITableViewDelegate { }

// MARK: - UIViewControllerDataSource
extension CommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
