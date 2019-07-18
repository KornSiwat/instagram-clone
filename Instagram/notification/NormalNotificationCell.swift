//
//  NotificationTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NormalNotificationCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!

    var notification: NormalNotification? {
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
extension NormalNotificationCell {
    func setupProfileImage() {
        profileImage.roundedImage()
    }
}

// MARK: - Update
extension NormalNotificationCell {
    func updateView() {
        updateProfileImageView()
        updateMessageLabel()
    }
    
    func updateProfileImageView() {
        profileImage.image = notification!.profileImage
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
extension NormalNotificationCell {
    func configure(notification: NormalNotification) {
        self.notification = notification
    }
}
