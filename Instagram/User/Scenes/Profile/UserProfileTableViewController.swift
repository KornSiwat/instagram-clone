//
//  UserProfileTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!

    let profileFacade: UserFacade = UserFacade()

    var profile: UserProfile? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavigationBar()
    }
}

// MARK: - Setup
extension UserProfileTableViewController {
    func setupData() {
        loadProfile()
    }

    func loadProfile() {
        loadingIndicatorView.startAnimating()
        
        profileFacade.loadProfile(completion: { (profile, error) in
            self.loadingIndicatorView.stopAnimating()
            self.tableView.refreshControl!.endRefreshing()
            
            guard profile != nil else { return }

            self.profile = profile
        })
    }
    
    func showNavigationBar() {
        navigationController!.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavigationBar() {
        navigationController!.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Update
extension UserProfileTableViewController {
    @IBAction func refresh(_ sender: Any) {
        loadProfile()
    }
}

// MARK: - UIScrollViewDelegate
extension UserProfileTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard profile != nil else { return }
        guard let postCell = tableView.visibleCells.last as? UserProfilePostTableViewCell else {
            return
        }

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
        guard profile != nil else { return 0 }

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
                           selfInfo: profile!.selfInfo,
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

    func onPostImagePress(selfInfo: UserInfo, post: Post) {
        performSegue(withIdentifier: "PostSegue",
                     sender: (selfInfo: selfInfo, post: post))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, sender) {
        case let(Segue.post, sender as (selfInfo: UserInfo, post: Post)):
            let destination = segue.destination as! PostViewController
            
            destination.configure(selfInfo: sender.selfInfo, post: sender.post)
        default:
            break
        }
    }
}
