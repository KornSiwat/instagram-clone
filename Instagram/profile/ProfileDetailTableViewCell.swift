//
//  ProfileDetailTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class ProfileDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var biography: UILabel!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    var userInfo: UserInfo? {
        didSet {
            profileImage.image = userInfo!.profileImage
            profileName.text = userInfo!.name
            biography.text = userInfo!.biography
            postCount.text = "\(userInfo!.postCount!)"
            followerCount.text = "\(userInfo!.followerCount!)"
            followingCount.text = "\(userInfo!.followingCount!)"
        }
    }
    
    override func awakeFromNib() {
        profileImage.roundedImage()
    }
}

// MARK: - Configure
extension ProfileDetailTableViewCell {
    func configure(selfInfo: UserInfo) {
        self.userInfo = selfInfo
    }
}
