//
//  UIImageView.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

extension UIImageView {
    func roundedImage() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
