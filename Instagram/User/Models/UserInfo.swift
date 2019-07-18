//
//  UserInfo.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/4/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserInfo {
    var profileImage: UIImage
    var name: String
    var biography: String?
    var postCount: Int?
    var followerCount: Int?
    var followingCount: Int?

    init(profileImage: UIImage,
         name: String,
         biography: String? = "",
         postCount: Int? = 0,
         followerCount: Int? = 0,
         followingCount: Int? = 0) {
        self.profileImage = profileImage
        self.name = name
        self.biography = biography
        self.postCount = postCount
        self.followerCount = followerCount
        self.followingCount = followingCount
    }
}
