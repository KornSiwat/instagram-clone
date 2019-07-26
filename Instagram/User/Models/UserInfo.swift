//
//  UserInfo.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/4/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserInfo {
    var profileImageUrl: URL
    var name: String
    var biography: String?
    var postCount: Int?
    var followerCount: Int?
    var followingCount: Int?

    init(_ selfInfo: FeedResponse.SelfInfo) {
        profileImageUrl = selfInfo.profileImageUrl
        name = selfInfo.name
        biography = selfInfo.biography
        postCount = selfInfo.postCount
        followerCount = selfInfo.followerCount
        followingCount = selfInfo.followingCount
    }

    init(_ selfInfo: ProfileResponse.SelfInfo) {
        profileImageUrl = selfInfo.profileImageUrl
        name = selfInfo.name
        biography = selfInfo.biography
        postCount = selfInfo.postCount
        followerCount = selfInfo.followerCount
        followingCount = selfInfo.followingCount
    }
    
    init(_ selfInfo: NotificationResponse.SelfInfo) {
        profileImageUrl = selfInfo.profileImageUrl
        name = selfInfo.name
        biography = selfInfo.biography
        postCount = selfInfo.postCount
        followerCount = selfInfo.followerCount
        followingCount = selfInfo.followingCount
    }
}

