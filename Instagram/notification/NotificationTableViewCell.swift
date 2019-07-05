//
//  NotificationTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!

    var name: String?
    var detail: String? {
        didSet {
            setupCommentLabel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImage()
    }
}

// MARK: - Setup
extension NotificationTableViewCell {
    func setupProfileImage() {
        profileImage.roundedImage()
    }

    func setupCommentLabel() {
        let detailText = "\(name!) \(detail!)"
        let attributedDetailLabelText = NSMutableAttributedString(string: detailText)

        attributedDetailLabelText.addAttribute(NSAttributedString.Key.font,
                                               value: UIFont.boldSystemFont(ofSize: 12),
                                               range: NSRange(location: 0, length: name!.count))
        detailLabel.attributedText = attributedDetailLabelText
    }
}
