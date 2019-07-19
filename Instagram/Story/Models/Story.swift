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
    let imageUrl: URL

    init(name: String, imageUrl: URL) {
        self.name = name
        self.imageUrl = imageUrl
    }
}
