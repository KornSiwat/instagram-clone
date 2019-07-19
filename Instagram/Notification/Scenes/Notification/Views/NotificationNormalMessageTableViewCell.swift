//
//  NotificationNormalMessageTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class NotificationNormalMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!

    var notification: NotificationNormalMessage? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImage()
    }
}

// MARK: - Setup
extension NotificationNormalMessageTableViewCell {
    func setupProfileImage() {
        profileImage.roundedImage()
    }
}

// MARK: - Update
extension NotificationNormalMessageTableViewCell {
    func updateView() {
        updateProfileImageView()
        updateMessageLabel()
    }

    func updateProfileImageView() {
        profileImage.kf.setImage(with: ImageResource(downloadURL: notification!.profileImageUrl),
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
}

// MARk: - Configure
extension NotificationNormalMessageTableViewCell {
    func configure(notification: NotificationNormalMessage) {
        self.notification = notification
    }
}
