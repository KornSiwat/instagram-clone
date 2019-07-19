//
//  UserProfilePostCollectionViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class UserProfilePostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var PostImageView: UIImageView!

    var post: Post? {
        didSet {
            updatePostImageView()
        }
    }
    var onPostImagePress: (() -> Void)?
}

// MARK: - Action
extension UserProfilePostCollectionViewCell {
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}

// MARK: - Update
extension UserProfilePostCollectionViewCell {
    func updatePostImageView() {
        PostImageView.kf.setImage(with: ImageResource(downloadURL: post!.postImageUrl),
                                  placeholder: DefaultImage.post)
    }
}

// MARK: - Configure
extension UserProfilePostCollectionViewCell {
    func configure(post: Post, onPostImagePress: @escaping (() -> Void)) {
        self.post = post
        self.onPostImagePress = onPostImagePress
    }
}
