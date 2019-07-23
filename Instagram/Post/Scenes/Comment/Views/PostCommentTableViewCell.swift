//
//  PostCommentTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class PostCommentTableViewCell: UITableViewCell {
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var comment: PostComment? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.roundedImage()
    }
}

// MARK: - Setup
extension PostCommentTableViewCell {
    func configure(comment: PostComment) {
        self.comment = comment
    }
}

// MARK: - Update
extension PostCommentTableViewCell {
    func updateView() {
        updateProfileImage()
        updateCommentLabel()
    }

    func updateProfileImage() {
        self.profileImageView.kf.setImage(with: ImageResource(downloadURL: comment!.profileImageUrl),
                                      placeholder: DefaultImage.profile)
    }

    func updateCommentLabel() {
        let profileName = comment!.profileName
        let commentBarText = "\(profileName) \(comment!.message)"
        let attributedCaptionBarText = NSMutableAttributedString(string: commentBarText)

        attributedCaptionBarText.addAttribute(NSAttributedString.Key.font,
                                              value: UIFont.boldSystemFont(ofSize: 12),
                                              range: NSRange(location: 0, length: profileName.count))
        commentLabel.attributedText = attributedCaptionBarText
    }
}
