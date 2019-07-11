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

    func config(profileImage: UIImage, name: String, message: String, post: Post, time: String = "20m") {
        self.profileImage.image = profileImage
        self.name = name
        self.message = message
        self.time = time
        self.post = post

        setupLikedPostImage()
        setupMessageLabel()
    }
}

// MARK: - action
extension LikeNotificationCell{
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}
