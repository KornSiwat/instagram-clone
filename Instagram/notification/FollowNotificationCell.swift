//
//  followNotificationCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/9/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class FollowNotificationCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!


    var name: String?
    var message: String? {
        didSet {
            setupMessageLabel()
        }
    }

    var time: String? = "20m"
    var isFollowing: Bool? {
        didSet {
            setupFollowButtonText()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}

// MARK: - Setup
extension FollowNotificationCell {
    func setupView() {
        setupProfileImage()
        setupFollowButtonShape()
    }

    func setupProfileImage() {
        profileImage.roundedImage()
    }

    func setupFollowButtonShape() {
        followButton.curvedButton()
    }

    func setupMessageLabel() {
        let detailText = "\(name!) \(message!) \(time!)"
        let attributedDetailLabelText = NSMutableAttributedString(string: detailText)

        attributedDetailLabelText.addAttribute(NSAttributedString.Key.font,
                                               value: UIFont.boldSystemFont(ofSize: 12),
                                               range: NSRange(location: 0, length: name!.count))
        messageLabel.attributedText = attributedDetailLabelText
    }

    func setupFollowButtonText() {
        if isFollowing! {
            followButton.setTitle("following", for: .normal)
            followButton.backgroundColor = UIColor.white
            followButton.setTitleColor(UIColor.black, for: .normal)

            return
        }

        followButton.setTitle("follow", for: .normal)
        followButton.backgroundColor = UIColor(red: 0.0,
                                               green: 0.65,
                                               blue: 1, alpha: 1)
        followButton.setTitleColor(UIColor.white, for: .normal)

    }
    
    func configure(notification: FollowNotification) {
        self.profileImage.image = notification.profileImage
        self.name = notification.name
        self.message = notification.message
        self.isFollowing = notification.isFollowing
    }
}

// MARK: - Action
extension FollowNotificationCell {
    @IBAction func buttonPress(_ sender: Any) {
        isFollowing = !isFollowing!
    }
}
