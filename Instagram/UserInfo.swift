//
//  userInfo.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/4/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserInfo {
    var name: String
    var profileImage: UIImage
    var postCount: Int?
    var followerCount: Int?
    var followingCount: Int?
    
    init(name: String, profileImage: UIImage) {
        self.name = name
        self.profileImage = profileImage
    }
}
