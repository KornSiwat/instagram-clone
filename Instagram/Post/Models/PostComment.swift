//
//  PostComment.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class PostComment {
    let profileName: String
    let profileImage: UIImage
    let message: String

    init(profileName: String, profileImage: UIImage?, message: String) {
        self.profileName = profileName
        self.profileImage = profileImage ?? UIImage(named: "defaultProfileImage")!
        self.message = message
    }
}
