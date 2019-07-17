//
//  HomeTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 6/30/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var facade = HomeFacade()
    var feed: Feed? {
        didSet {
            updateView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
}

// MARK: - Setup
extension HomeTableViewController {
    func setupData() {
        loadFeed()
    }
    
    func loadFeed() {
        feed = facade.loadFeed()
    }
}

// MARK: - Update
extension HomeTableViewController {
    func updateView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeTableViewController {
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
extension HomeTableViewController {
    enum Segue {
        static let comment = "CommentSegue"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination, sender) {
        case let (Segue.comment,
                  destination as CommentViewController,
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
