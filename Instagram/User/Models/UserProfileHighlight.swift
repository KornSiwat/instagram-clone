//
//  UserProfileHighlight.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserProfileHighlight {
    var previewImageUrl: URL
    var name: String
    
    init(previewImageUrl: URL, name: String) {
        self.previewImageUrl = previewImageUrl
        self.name = name
    }
}
