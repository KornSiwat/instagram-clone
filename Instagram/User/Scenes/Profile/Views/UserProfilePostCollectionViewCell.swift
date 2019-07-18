//
//  UserProfilePostCollectionViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserProfilePostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!

    var onPostImagePress: (() -> Void)?
}

// MARK: - Action
extension UserProfilePostCollectionViewCell {
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}

// MARK: - Configure
extension UserProfilePostCollectionViewCell {
    func configure(post: Post, onPostImagePress: @escaping (() -> Void)) {
        self.image.image = post.postImage
        self.onPostImagePress = onPostImagePress
    }
}
