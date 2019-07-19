//
//  PostCommentViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class PostCommentViewController: UIViewController {
    @IBOutlet weak var commentBarProfileImage: UIImageView!
    @IBOutlet weak var commentBarView: UIView!
    @IBOutlet weak var commentBarBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBAction func textFieldEditingChange(_ sender: Any) {
        updatePostButtonState()
    }

    var selfInfo: UserInfo? {
        didSet {
            updateCommentBarProfileImage()
        }
    }
    var comments: [PostComment]?
    var updateCommentsData: (([PostComment]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObserver()
        updateCommentsData!(comments!)
    }
}

// MARK: - Setup
extension PostCommentViewController {
    func setupView() {
        setupProfileImage()
        addKeyboardObserver()
    }

    func setupProfileImage() {
        commentBarProfileImage.roundedImage()
    }
}

// MARK: - Update
extension PostCommentViewController {
    func updateCommentBarProfileImage() {
        commentBarProfileImage.kf.setImage(with: ImageResource(downloadURL: selfInfo!.profileImageUrl),
                                           placeholder: DefaultImage.profile)
    }
}

// MARK: - Table Action
extension PostCommentViewController {
    @IBAction func dismissKeyboard(_ sender: Any) {
        dismissKeyboard()
    }

    func dismissKeyboard() {
        view.endEditing(true)
        commentBarBottomLayoutConstraint.constant = 0
        view.layoutIfNeeded()
    }
}

// MARK: - CommentBar Action
extension PostCommentViewController {
    @IBAction func postButtonPress(_ sender: Any) {
        let newIndexPath = IndexPath(row: comments!.count, section: 0)

        comments?.append(PostComment(profileName: selfInfo!.name,
                                     profileImageUrl: selfInfo!.profileImageUrl,
                                     message: commentTextField.text!))
        tableView.insertRows(at: [newIndexPath], with: .automatic)

        commentTextField.text! = ""
        dismissKeyboard()
    }

    func updatePostButtonState() {
        postButton.isEnabled = !(commentTextField.text!.isEmpty)
    }
}

// MARK: - Keyboard Observer
extension PostCommentViewController {
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

        commentBarBottomLayoutConstraint.constant = keyboardHeight
        view.layoutIfNeeded()
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        let keyboardInfo = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue)
        let keyboardHeight = keyboardInfo.cgRectValue.height

        commentBarBottomLayoutConstraint.constant = keyboardHeight
        view.layoutIfNeeded()
    }
}

// MARK: - TableViewDelegate
extension PostCommentViewController: UITableViewDelegate { }

// MARK: - TableViewDataSource
extension PostCommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CommentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! PostCommentTableViewCell
        let comment = comments![indexPath.row]

        cell.configure(comment: comment)

        return cell
    }
}

// MARK: - Configure
extension PostCommentViewController {
    func configure(selfInfo: UserInfo,
                   comments: [PostComment],
                   updateCommentsData: @escaping ([PostComment]) -> Void) {
        self.selfInfo = selfInfo
        self.comments = comments
        self.updateCommentsData = updateCommentsData
    }
}
