//
//  PostViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/10/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentBarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentBarProfileImage: UIImageView!
    @IBOutlet weak var postButton: UIButton!

    var selfInfo: UserInfo?
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        commentBarProfileImage.image = selfInfo!.profileImage
        setupProfileImage()
        addKeyboardObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObserver()
    }
}

// MARK: - Setup
extension PostViewController {
    func setupProfileImage() {
        commentBarProfileImage.roundedImage()
    }
}

// MARK: - TableViewDelegate
extension PostViewController: UITableViewDelegate { }

// MARK: - TableViewDataSource
extension PostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return post!.comments.isEmpty ? 1 : 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return post!.comments.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellIdentifier = "PostCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostTableViewCell

            cell.headerImage.image = post!.profileImage
            cell.profileName.text = post!.name
            cell.location.text = post!.location
            cell.postImage.image = post!.postImage
            cell.isLiked = post!.isLiked
            cell.likeCount.text = "\(post!.likeCount)"
            cell.caption = post!.caption
            cell.location.isHidden = cell.location.text!.isEmpty
            cell.likeBar.isHidden = post!.likeCount == 0

            cell.onLike = {
                self.post!.isLiked = !self.post!.isLiked
                if self.post!.isLiked {
                    self.post!.likeCount += 1
                } else {
                    self.post!.likeCount -= 1
                }

                tableView.reloadRows(at: [indexPath], with: .none)
            }

            cell.onCommentPress = { }

            return cell
        default:
            let cellIdentifier = "CommentCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CommentTableViewCell
            let comment = post!.comments[indexPath.row]

            cell.profileImage.image = comment.profileImage
            cell.profileName = comment.profileName
            cell.message = comment.message

            return cell
        }
    }
}

// MARK: - Keyboard Observer
extension PostViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: self.view.window)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(sender:)),
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

    @objc func keyboardWillHide(sender: NSNotification) {
        let keyboardInfo = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue)
        let keyboardHeight = keyboardInfo.cgRectValue.height

        commentBarBottomConstraint.constant = keyboardHeight
        view.layoutIfNeeded()
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        let keyboardInfo = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue)
        let keyboardHeight = keyboardInfo.cgRectValue.height

        commentBarBottomConstraint.constant = keyboardHeight
        view.layoutIfNeeded()
    }
}
