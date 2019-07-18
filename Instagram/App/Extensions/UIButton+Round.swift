//
//  UIButton.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/11/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

extension UIButton {
    func roundedButton() {
        layer.cornerRadius = frame.size.width / 16
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
