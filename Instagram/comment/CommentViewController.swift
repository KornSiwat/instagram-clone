//
//  CommentViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    @IBOutlet weak var commentBarProfileImage: UIImageView!

    var comments: [Comment]?

    override func viewDidLoad() {
        super.viewDidLoad()
        commentBarProfileImage.roundedImage()
        addKeyboardObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
}

// MARK: - Keyboard Observer
extension CommentViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: Selector(("keyboardWillShow:")),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: self.view.window)
        NotificationCenter.default.addObserver(self,
                                               selector: Selector(("keyboardWillHide:")),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: self.view.window)
    }

    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: self.view.window)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: self.view.window)
    }
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
