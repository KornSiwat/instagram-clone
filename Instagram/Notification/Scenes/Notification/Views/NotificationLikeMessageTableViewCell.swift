//
//  NotificationLikeMessageTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class NotificationLikeMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var likedImageView: UIImageView!

    var notification: NotificationLikeMessage? {
        didSet {
            updateView()
        }
    }
    var onPostImagePress: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}

// MARK: - Setup
extension NotificationLikeMessageTableViewCell {
    func setupView() {
        setupProfileImage()
    }

    func setupProfileImage() {
        profileImageView.roundedImage()
    }
}

// MARK: - Update
extension NotificationLikeMessageTableViewCell {
    func updateView() {
        updateProfileImage()
        updateMessageLabel()
        updateLikedPostImage()
    }

    func updateMessageLabel() {
        let detailText = "\(notification!.name) \(notification!.message) \(notification!.time)"
        let attributedDetailLabelText = NSMutableAttributedString(string: detailText)

        attributedDetailLabelText.addAttribute(NSAttributedString.Key.font,
                                               value: UIFont.boldSystemFont(ofSize: 12),
                                               range: NSRange(location: 0, length: notification!.name.count))
        messageLabel.attributedText = attributedDetailLabelText
    }

    func updateLikedPostImage() {
        self.likedImageView.kf.setImage(with: ImageResource(downloadURL: notification!.likedPost.postImageUrl),
                                        placeholder: DefaultImage.post)
    }

    func updateProfileImage() {
        self.profileImageView.kf.setImage(with: ImageResource(downloadURL: notification!.profileImageUrl),
                                          placeholder: DefaultImage.profile)
    }
}

// MARK: - Action
extension NotificationLikeMessageTableViewCell {
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}

// MARK: - configure
extension NotificationLikeMessageTableViewCell {
    func configure(notification: NotificationLikeMessage, onPostImagePress: @escaping () -> Void) {
        self.notification = notification
        self.onPostImagePress = onPostImagePress
    }
}
