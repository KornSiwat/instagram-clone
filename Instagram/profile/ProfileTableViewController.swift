//
//  ProfileTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    let profileFacade: ProfileFacade = ProfileFacade()
    var profile: Profile?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfile()
    }
}

// MARK: - Setup
extension ProfileTableViewController {
    func loadProfile() {
        profile = profileFacade.loadProfile()
    }
}

// MARK: - UIScrollViewDelegate
extension ProfileTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let postCell = tableView.visibleCells.last as! ProfilePostTableViewCell
        if scrollView.contentOffset.y >= 203 {
            postCell.collectionView.isScrollEnabled = true

        } else {
            postCell.collectionView.isScrollEnabled = false
        }
    }
}

// MARK: - Table view data source
extension ProfileTableViewController {
    enum Section: Int {
        case profileDetail
        case highlight
        case post

        var cellIdentifier: String {
            switch self {
            case .profileDetail:
                return "ProfileDetailCell"
            case .highlight:
                return "HighlightCell"
            case .post:
                return "ProfilePostTableCell"
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!
        let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier,
                                                 for: indexPath)
        configure(cell)

        return cell
    }

    func configure(_ cell: UITableViewCell) {
        switch cell {
        case let cell as ProfileDetailTableViewCell:
            cell.configure(selfInfo: profile!.selfInfo)
        case let cell as HighlightTableViewCell:
            cell.configure(highlights: profile!.highlights)
        case let cell as ProfilePostTableViewCell:
            cell.configure(cellHeight: tableView.frame.height,
                           posts: profile!.posts,
                           onPostImagePress: onPostImagePress)
        default:
            break
        }
    }
}

// MARK: - Navigation
extension ProfileTableViewController {
    func onPostImagePress(post: Post) {
        self.performSegue(withIdentifier: "PostSegue", sender: post)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PostViewController
        let post = sender as! Post

        destination.configure(selfInfo: profile!.selfInfo, post: post)
    }
}
