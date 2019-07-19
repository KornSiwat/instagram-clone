//
//  UserProfileDetailTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Kingfisher

class UserProfileDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var biography: UILabel!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!

    var userInfo: UserInfo? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        profileImage.roundedImage()
    }
}

// MARK: - Update
extension UserProfileDetailTableViewCell {
    func updateView() {
        updateProfileImage()
        updateProfileName()
        updateBiography()
        updatePostCount()
        updateFollowerCount()
        updateFollowingCount()
    }

    func updateProfileImage() {
        profileImage.kf.setImage(with: ImageResource(downloadURL: userInfo!.profileImageUrl),
                                 placeholder: DefaultImage.profile)
    }

    func updateProfileName() {
        profileName.text = userInfo!.name
    }

    func updateBiography() {
        biography.text = userInfo!.biography
    }

    func updatePostCount() {
        postCount.text = "\(userInfo!.postCount!)"
    }

    func updateFollowerCount() {
        followerCount.text = "\(userInfo!.followerCount!)"
    }

    func updateFollowingCount() {
        followingCount.text = "\(userInfo!.followingCount!)"
    }
}

// MARK: - Configure
extension UserProfileDetailTableViewCell {
    func configure(selfInfo: UserInfo) {
        self.userInfo = selfInfo
    }
}
