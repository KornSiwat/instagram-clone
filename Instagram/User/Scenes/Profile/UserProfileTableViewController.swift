//
//  UserProfileTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    let profileFacade: UserFacade = UserFacade()
    var profile: UserProfile?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
}

// MARK: - Setup
extension UserProfileTableViewController {
    func setupData() {
        loadProfile()
    }

    func loadProfile() {
        profile = profileFacade.loadProfile()
    }
}

// MARK: - UIScrollViewDelegate
extension UserProfileTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let postCell = tableView.visibleCells.last as! UserProfilePostTableViewCell

        postCell.collectionView.isScrollEnabled = scrollView.contentOffset.y >= 203
    }
}

// MARK: - Table view data source
extension UserProfileTableViewController {
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
        case let cell as UserProfileDetailTableViewCell:
            cell.configure(selfInfo: profile!.selfInfo)
        case let cell as UserProfileHighlightTableViewCell:
            cell.configure(highlights: profile!.highlights)
        case let cell as UserProfilePostTableViewCell:
            cell.configure(cellHeight: tableView.frame.height,
                           posts: profile!.posts,
                           onPostImagePress: onPostImagePress)
        default:
            break
        }
    }
}

// MARK: - Navigation
extension UserProfileTableViewController {
    enum Segue {
        static let post = "PostSegue"
    }

    func onPostImagePress(post: Post) {
        performSegue(withIdentifier: "PostSegue", sender: post)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.post:
            let destination = segue.destination as! PostViewController
            let post = sender as! Post

            destination.configure(selfInfo: profile!.selfInfo, post: post)
        default:
            break
        }
    }
}
