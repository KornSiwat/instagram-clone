//
//  IikeNotificationCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class LikeNotificationCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var likedImage: UIImageView!

    var notification: LikeNotification? {
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
extension LikeNotificationCell {
    func setupView() {
        setupProfileImage()
    }

    func setupProfileImage() {
        profileImage.roundedImage()
    }
}

// MARK: - Update
extension LikeNotificationCell {
    func updateView() {
        updateLikedPostImage()
        updateMessageLabel()
        updateProfileImage()
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
        self.likedImage.image = notification!.likedPost.postImage
    }

    func updateProfileImage() {
        self.profileImage.image = notification!.profileImage
    }
}

// MARK: - Action
extension LikeNotificationCell {
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}

// MARK: - configure
extension LikeNotificationCell {
    func configure(notification: LikeNotification, onPostImagePress: @escaping () -> Void) {
        self.notification = notification
        self.onPostImagePress = onPostImagePress
    }
}
