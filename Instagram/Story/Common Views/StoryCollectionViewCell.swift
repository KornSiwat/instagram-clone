//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    override func awakeFromNib() {
        profileImage.roundedImage()
    }
}

// MARK: - Setup
extension StoryCollectionViewCell {
    func configure(story: Story) {
        self.profileImage.image = story.image
        self.profileName.text = story.name
    }
}
