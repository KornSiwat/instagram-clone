//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeBar: UIStackView!
    @IBOutlet weak var headerImage: UIImageView! {
        didSet {
            commentImage.image = headerImage.image
        }
    }

    var onLike: (() -> Void)?
    var onCommentPress: (() -> Void)?

    var caption: String = "" {
        didSet {
            setupCommentLabel()
        }
    }

    var isLiked: Bool = false {
        didSet {
            if isLiked {
                likeButton.setImage(UIImage(named: "likeFilled"), for: .normal)
                return
            }

            likeButton.setImage(UIImage(named: "like"), for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImage()
    }
}

// MARK: - Setup
extension PostTableViewCell {
    func setupProfileImage() {
        headerImage.roundedImage()
        commentImage.roundedImage()
    }

    func setupCommentLabel() {
        let profileName = self.profileName.text
        let captionBarText = "\(profileName!) \(caption)"
        let attributedCaptionBarText = NSMutableAttributedString(string: captionBarText)
        
        attributedCaptionBarText.addAttribute(NSAttributedString.Key.font,
                                              value: UIFont.boldSystemFont(ofSize: 12),
                                              range: NSRange(location: 0, length: profileName!.count))
        captionLabel.attributedText = attributedCaptionBarText
    }
}

// MARK: - Action
extension PostTableViewCell {
    @IBAction func likeButtonPress(_ sender: UIButton) {
        onLike!()
    }

    @IBAction func commentButtonPress(_ sender: Any) {
        onCommentPress!()
    }
}
