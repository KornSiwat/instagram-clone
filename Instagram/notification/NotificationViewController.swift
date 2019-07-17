//
//  NotificationViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Parchment

class NotificationViewController: UIViewController {
    let pagingViewController = PagingViewController<PagingIndexItem>()
    let notificationFacade: NotificationFacade = NotificationFacade()

    var selfInfo: UserInfo?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupData()
    }
}

// MARK: - Setup
extension NotificationViewController {
    func setupView() {
        setupPagingView()
    }

    func setupPagingView() {
        pagingViewController.dataSource = self
        self.pagingViewController.select(index: 1, animated: false)
        pagingViewController.options.indicatorColor = UIColor.black
        pagingViewController.options.textColor = UIColor.black
        pagingViewController.options.selectedTextColor = UIColor.black

        addChild(pagingViewController)
        pagingViewController.didMove(toParent: self)

        view.addSubview(pagingViewController.view)

        pagingViewController.view!.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: pagingViewController.view!,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: pagingViewController.view!,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: pagingViewController.view!,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: view,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1, constant: 22)
        let bottomConstraint = NSLayoutConstraint(item: pagingViewController.view!,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1, constant: 0)
        view.addConstraints([leadingConstraint,
                             trailingConstraint,
                             topConstraint,
                             bottomConstraint])
        view.layoutIfNeeded()
    }

    func setupData() {
        loadSelfInfo()
    }

    func loadSelfInfo() {
        selfInfo = notificationFacade.loadSelfInfo()
    }
}

// MARK: - PagingViewControllerDataSource
extension NotificationViewController: PagingViewControllerDataSource {
    enum Page {
        static let followingActivities = 0
        static let notification = 1
    }

    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int {
        return 2
    }

    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController {
        switch index {
        case Page.followingActivities:
            let storyboard = UIStoryboard.init(name: "Notification", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "FollowingTableViewController") as! FollowingTableViewController

            viewController.configure(onPostImagePress: onPostImagePress)

            return viewController
        case Page.notification:
            let storyboard = UIStoryboard.init(name: "Notification", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "NotificationTableViewController") as! NotificationTableViewController

            viewController.configure(onPostImagePress: onPostImagePress)

            return viewController
        default:
            return UIViewController()
        }
    }

    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T {
        switch index {
        case Page.followingActivities:
            return PagingIndexItem(index: index, title: "Following") as! T
        case Page.notification:
            return PagingIndexItem(index: index, title: "You") as! T
        default:
            return PagingIndexItem(index: index, title: "default") as! T
        }
    }
}

// MARK: - Navigation
extension NotificationViewController {
    enum Segue {
        static let post = "PostSegue"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination, sender) {
        case let (Segue.post, destination as PostViewController, post as Post):
            destination.configure(selfInfo: selfInfo!,
                                  post: post)
        default:
            break
        }
    }

    func onPostImagePress(post: Post) {
        performSegue(withIdentifier: "PostSegue",
                     sender: post)
    }
}
