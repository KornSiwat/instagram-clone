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
            setupFollowButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImage()
    }
}

// MARK: - Setup
extension FollowNotificationCell {
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
    
    func setupFollowButton() {
        if isFollowing! {
            followButton.setTitle("following", for: .normal)
            
            return
        }
        
        followButton.setTitle("follow", for: .normal)
    }
}

// MARK: - Action
extension FollowNotificationCell {
    @IBAction func buttonPress(_ sender: Any) {
        isFollowing = !isFollowing!
    }
}
