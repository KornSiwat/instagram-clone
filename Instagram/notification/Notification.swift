//
//  Notification.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class Notification {
    let image: UIImage
    let name: String
    let message: String

    init(image: UIImage, name: String, message: String) {
        self.image = image
        self.name = name
        self.message = message
    }
}
