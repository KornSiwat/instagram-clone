//
//  PostViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/10/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class PostViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentBarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        updatePostButtonState()
    }
    @IBOutlet weak var commentBarProfileImageView: UIImageView!
    
    var selfInfo: UserInfo?
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        clearView()
    }
}

// MARK: - Setup
extension PostViewController {
    func setupView() {
        setupProfileImage()
        addKeyboardObserver()
        hideNavigationBar()
        
        updateCommentBarView()
    }

    func setupProfileImage() {
        commentBarProfileImageView.roundedImage()
    }

    func clearView() {
        removeKeyboardObserver()
        showNavigationBar()
    }

    func showNavigationBar() {
        navigationController!.setNavigationBarHidden(true, animated: false)
    }

    func hideNavigationBar() {
        navigationController!.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Update
extension PostViewController {
    func updateCommentBarView() {
        updateCommentBarProfileImage()
    }

    func updateCommentBarProfileImage() {
        commentBarProfileImageView.kf.setImage(with: ImageResource(downloadURL: selfInfo!.profileImageUrl),
                                               placeholder: DefaultImage.profile)
    }
}

// MARK: - TableViewDelegate
extension PostViewController: UITableViewDelegate { }

// MARK: - TableViewDataSource
extension PostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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

            cell.configure(post: post!,
                           onLike: {
                               self.post!.isLiked = !self.post!.isLiked
                               self.post!.likeCount += self.post!.isLiked ? 1 : -1

                               tableView.reloadRows(at: [indexPath], with: .none)
                           },
                           onCommentPress: { })

            return cell
        default:
            let cellIdentifier = "CommentCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! PostCommentTableViewCell
            let comment = post!.comments[indexPath.row]

            cell.configure(comment: comment)

            return cell
        }
    }
}

// MARK: - Table Action
extension PostViewController {
    @IBAction func dismissKeyboard(_ sender: Any) {
        dismissKeyboard()
    }

    func dismissKeyboard() {
        view.endEditing(true)
        commentBarBottomConstraint.constant = 0
        view.layoutIfNeeded()
    }
}

// MARK: - CommentBar Action
extension PostViewController {
    @IBAction func postButtonPress(_ sender: Any) {
        let newIndexPath = IndexPath(row: post!.comments.count, section: 1)

        post!.comments.append(PostComment(profileName: selfInfo!.name,
                                          profileImageUrl: selfInfo!.profileImageUrl,
                                          message: commentTextField.text!))
        tableView.insertRows(at: [newIndexPath], with: .automatic)

        commentTextField.text! = ""
        updatePostButtonState()

        dismissKeyboard()
    }

    func updatePostButtonState() {
        postButton.isEnabled = !(commentTextField.text!.isEmpty)
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

// MARK: - Configure
extension PostViewController {
    func configure(selfInfo: UserInfo, post: Post) {
        self.selfInfo = selfInfo
        self.post = post
    }
}
