//
//  story.swift
//  Instagram
//
//  Created by Siwat Ponpued on 6/30/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class Story {
    let name: String
    let previewImageUrl: URL
    
    init(_ story: FeedResponse.Story) {
        name = story.name
        previewImageUrl = story.previewImageUrl
    }
}
