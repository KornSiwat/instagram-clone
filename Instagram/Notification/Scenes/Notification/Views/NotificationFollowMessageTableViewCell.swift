//
//  NotificationFollowMessageTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class NotificationFollowMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!

    var notification: NotificationFollowMessage? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}

// MARK: - Setup
extension NotificationFollowMessageTableViewCell {
    func setupView() {
        setupProfileImage()
        setupFollowButtonShape()
    }

    func setupProfileImage() {
        profileImage.roundedImage()
    }

    func setupFollowButtonShape() {
        followButton.roundedButton()
    }
}

// MARK: - Update
extension NotificationFollowMessageTableViewCell {
    func updateView() {
        updateProfileImage()
        updateMessageLabel()
        updateFollowButtonText()
    }

    func updateProfileImage() {
        self.profileImage.kf.setImage(with: ImageResource(downloadURL: notification!.profileImageUrl),
                                      placeholder: DefaultImage.profile)
    }

    func updateMessageLabel() {
        let detailText = "\(notification!.name) \(notification!.message) \(notification!.time)"
        let attributedDetailLabelText = NSMutableAttributedString(string: detailText)

        attributedDetailLabelText.addAttribute(NSAttributedString.Key.font,
                                               value: UIFont.boldSystemFont(ofSize: 12),
                                               range: NSRange(location: 0, length: notification!.name.count))
        messageLabel.attributedText = attributedDetailLabelText
    }

    func updateFollowButtonText() {
        let (title, titleColor, backgroundColor): (String, UIColor, UIColor) = notification!.isFollowing
            ? ("following", .black, .white)
            : ("follow", .white, UIColor(red: 0.0, green: 0.65, blue: 1, alpha: 1))

        followButton.setTitle(title, for: .normal)
        followButton.setTitleColor(titleColor, for: .normal)
        followButton.backgroundColor = backgroundColor
    }
}

// MARK: - Action
extension NotificationFollowMessageTableViewCell {
    @IBAction func buttonPress(_ sender: Any) {
        notification!.isFollowing = !notification!.isFollowing
        updateFollowButtonText()
    }
}

// MARK: - Configure
extension NotificationFollowMessageTableViewCell {
    func configure(notification: NotificationFollowMessage) {
        self.notification = notification
    }
}
