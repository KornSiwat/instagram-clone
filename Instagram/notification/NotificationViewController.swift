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
    let selfInfo: UserInfo = UserInfo(profileImage: UIImage(named: "salahProfile")!,
                                      name: "kkornsw")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup
extension NotificationViewController {
    func setupView() {
        let pagingViewController = PagingViewController<PagingIndexItem>()
        pagingViewController.dataSource = self
        pagingViewController.select(index: 0)
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
}

// MARK: - PagingViewControllerDataSource
extension NotificationViewController: PagingViewControllerDataSource {
    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int {
        return 2
    }

    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController {
        switch index {
        case 0:
            let storyboard = UIStoryboard.init(name: "Notification", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "FollowingTableViewController") as! FollowingTableViewController

            viewController.selfInfo = selfInfo
            viewController.onPostImagePress = onPostImagePress

            return viewController
        default:
            let storyboard = UIStoryboard.init(name: "Notification", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "NotificationTableViewController") as! NotificationTableViewController

            viewController.selfInfo = selfInfo
            viewController.onPostImagePress = onPostImagePress

            return viewController
        }
    }

    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T {
        switch index {
        case 0:
            return PagingIndexItem(index: index, title: "Following") as! T
        default:
            return PagingIndexItem(index: index, title: "You") as! T
        }
    }
}

// MARK: - Navigation
extension NotificationViewController {
    func onPostImagePress(post: Post) -> (() -> Void) {
        return { self.performSegue(withIdentifier: "PostSegue", sender: post) }
    }
}

// MARK: - Navigation
extension NotificationViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PostViewController
        let post = sender as! Post
        
        destination.selfInfo = selfInfo
        destination.post = post
    }
}
