
//
//  UserProfile.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

struct UserProfile {
    let selfInfo: UserInfo
    let highlights: [UserProfileHighlight]
    let posts: [Post]

    init(response: ProfileResponse) {
        selfInfo = UserInfo(response.selfInfo)

        highlights = response.highlights.map(UserProfileHighlight.init)

        posts = response.posts.map(Post.init)
    }
}

