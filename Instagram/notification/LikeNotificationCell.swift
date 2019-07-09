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
    var message: String? {
        didSet {
            setupMessageLabel()
        }
    }

    var time: String? = "20m"

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
}
