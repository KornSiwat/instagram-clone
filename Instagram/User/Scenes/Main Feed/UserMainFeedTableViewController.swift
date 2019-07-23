//
//  UserMainFeedTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 6/30/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import PromiseKit

class UserMainFeedTableViewController: UITableViewController {
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    var facade = UserFacade()
    var feed: UserFeed? {
        didSet {
            updateView()
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
extension UserMainFeedTableViewController {
    func setupData() {
        setupFeedData()
    }
    
    func setupFeedData() {
        loadingIndicatorView.startAnimating()
        loadFeed().finally {
            self.loadingIndicatorView.stopAnimating()
        }
    }

    func loadFeed() -> PMKFinalizer {
        return facade.loadFeedPMK()
            .done { self.feed = $0 }
            .catch { error in print(error) }
    }
    
    func showNavigationBar() {
        navigationController!.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavigationBar() {
        navigationController!.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Update
extension UserMainFeedTableViewController {
    func updateView() {
        tableView.reloadData()
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        loadFeed().finally {
            self.tableView.refreshControl!.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource
extension UserMainFeedTableViewController {
    enum Section: Int {
        case story
        case post

        var cellIdentifier: String {
            switch self {
            case .story:
                return "StoryCell"
            case .post:
                return "PostCell"
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard feed != nil else { return 0 }
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .some(.story):
            return 1
        case .some(.post):
            return feed!.posts.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!
        let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier,
                                                 for: indexPath)

        configure(cell, at: indexPath)

        return cell
    }

    func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        switch cell {
        case let cell as StoryTableViewCell:
            cell.stories = feed!.stories
        case let cell as PostTableViewCell:
            let post = feed!.posts[indexPath.row]

            cell.configure(post: post,
                           onLike: {
                               post.isLiked = !post.isLiked
                               post.likeCount += post.isLiked ? 1 : -1

                               self.tableView.reloadRows(at: [indexPath], with: .none)
                           },
                           onCommentPress: {
                               self.performSegue(withIdentifier: Segue.comment, sender: post)
                           })
        default:
            break
        }
    }
}

// MARK: - Navigation
extension UserMainFeedTableViewController {
    enum Segue {
        static let comment = "CommentSegue"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination, sender) {
        case let (Segue.comment,
                  destination as PostCommentViewController,
                  post as Post):
            destination.configure(selfInfo: feed!.selfInfo,
                                  comments: post.comments,
                                  updateCommentsData: { comments in
                                      post.comments = comments
                                  })
        default:
            break
        }
    }
}
