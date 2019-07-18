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
    let image: UIImage

    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image ?? UIImage(named: "defaultProfileImage")!
    }
}
