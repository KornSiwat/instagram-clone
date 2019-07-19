//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeBar: UIStackView!
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            commentImage.image = profileImageView.image
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
        profileImageView.roundedImage()
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

// MARK: - Update
extension PostTableViewCell {
    func updateProfileImage(url: URL) {
        self.profileImageView.kf.setImage(with: ImageResource(downloadURL: url),
                                          placeholder: DefaultImage.profile)
    }

    func updatePostImage(url: URL) {
        self.postImageView.kf.setImage(with: ImageResource(downloadURL: url),
                                       placeholder: DefaultImage.post)
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

// MARK: - Configure
extension PostTableViewCell {
    func configure(post: Post,
                   onLike: @escaping () -> Void,
                   onCommentPress: @escaping () -> Void) {
        self.profileName.text = post.profileName
        self.location.text = post.location
        self.isLiked = post.isLiked
        self.likeCount.text = "\(post.likeCount)"
        self.caption = post.caption

        self.location.isHidden = self.location.text!.isEmpty
        self.likeBar.isHidden = post.likeCount == 0

        self.onLike = onLike
        self.onCommentPress = onCommentPress
    }
}
