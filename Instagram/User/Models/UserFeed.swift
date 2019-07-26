//
//  UserFeed.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import Foundation

struct UserFeed {
    let selfInfo: UserInfo
    let stories: [Story]
    let posts: [Post]
    
    init(response: FeedResponse) {
        selfInfo = UserInfo(response.selfInfo)
        
        stories = response.stories.map(Story.init)
        
        posts = response.posts.map(Post.init)
    }
}
