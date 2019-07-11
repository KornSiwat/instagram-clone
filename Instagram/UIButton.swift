//
//  UIButton.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/11/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

extension UIButton {
    func curvedButton() {
        self.layer.cornerRadius = self.frame.size.width / 16
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
