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
    @IBOutlet weak var commentBarView: UIView!
    @IBOutlet weak var commentBarBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBAction func textFieldEditingChange(_ sender: Any) {
        updatePostButtonState()
    }
    
    var selfInfo: UserInfo?
    var comments: [Comment]?
    var updateCommentsData: (([Comment]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        commentBarProfileImage.image = selfInfo!.profileImage
        commentBarProfileImage.roundedImage()
        addKeyboardObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
        updateCommentsData!(comments!)
    }
}

// MARK: - Table Action
extension CommentViewController {
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}

// MARK: - CommentBar Action
extension CommentViewController {
    @IBAction func postButtonPress(_ sender: Any) {
        let newIndexPath = IndexPath(row: comments!.count, section: 0)
        
        comments?.append(Comment(profileName: selfInfo!.name,
                                 profileImage: selfInfo!.profileImage,
                                 message: commentTextField.text!))
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        
        commentTextField.text! = ""
        view.endEditing(true)
    }

    func updatePostButtonState() {
        postButton.isEnabled = !(commentTextField.text!.isEmpty)
    }
}

// MARK: - Keyboard Observer
extension CommentViewController {
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
