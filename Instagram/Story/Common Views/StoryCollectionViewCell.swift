//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!

    override func awakeFromNib() {
        profileImage.roundedImage()
    }
}

// MARK: - Update
extension StoryCollectionViewCell {
    func updateProfileImage(url: URL) {
        let defaultImage = UIImage(named: "defaultProfileImage")!

        profileImage.kf.setImage(with: url, placeholder: defaultImage)
    }
}

// MARK: - Configure
extension StoryCollectionViewCell {
    func configure(story: Story) {
        self.profileName.text = story.name

        updateProfileImage(url: story.imageUrl)
    }
}
