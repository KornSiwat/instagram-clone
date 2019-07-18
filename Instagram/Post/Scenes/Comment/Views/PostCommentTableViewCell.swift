//
//  PostCommentTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class PostCommentTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!

    var profileName: String?
    var message: String? {
        didSet {
            setupCommentLabel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.roundedImage()
    }
}

// MARK: - Setup
extension PostCommentTableViewCell {
    func setupCommentLabel() {
        let profileName = self.profileName!
        let commentBarText = "\(profileName) \(message!)"
        let attributedCaptionBarText = NSMutableAttributedString(string: commentBarText)

        attributedCaptionBarText.addAttribute(NSAttributedString.Key.font,
                                              value: UIFont.boldSystemFont(ofSize: 12),
                                              range: NSRange(location: 0, length: profileName.count))
        commentLabel.attributedText = attributedCaptionBarText
    }
    
    func configure(comment: PostComment) {
        self.profileImage.image = comment.profileImage
        self.profileName = comment.profileName
        self.message = comment.message
    }
}
