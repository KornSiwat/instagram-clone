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
            return UITableViewController()
        default:
            let storyboard = UIStoryboard.init(name: "Notification", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "NotificationTableViewController")
            
            return viewController
        }
    }

    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T {
        return PagingIndexItem(index: index, title: "View \(index)") as! T
    }
}
