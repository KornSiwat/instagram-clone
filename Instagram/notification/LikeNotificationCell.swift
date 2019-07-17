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

    var name: String?
    var message: String?
    var post: Post?
    var time: String?

    var onPostImagePress: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.roundedImage()
    }
}

// MARK: - Setup
extension LikeNotificationCell {
    func setupProfileImage() {
        profileImage.roundedImage()
    }

    func setupMessageLabel() {
        let detailText = "\(name!) \(message!) \(time!)"
        let attributedDetailLabelText = NSMutableAttributedString(string: detailText)

        attributedDetailLabelText.addAttribute(NSAttributedString.Key.font,
                                               value: UIFont.boldSystemFont(ofSize: 12),
                                               range: NSRange(location: 0, length: name!.count))
        messageLabel.attributedText = attributedDetailLabelText
    }

    func setupLikedPostImage() {
        self.likedImage.image = self.post!.postImage
    }
}

// MARK: - action
extension LikeNotificationCell {
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}

// MARK: - configure
extension LikeNotificationCell {
    func configure(notification: LikeNotification, onPostImagePress: @escaping () -> Void) {
        self.profileImage.image = notification.profileImage
        self.name = notification.name
        self.message = notification.message
        self.time = notification.time
        self.post = notification.likedPost
        self.onPostImagePress = onPostImagePress
        
        setupLikedPostImage()
        setupMessageLabel()
    }
}
