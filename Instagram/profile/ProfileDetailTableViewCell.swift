//
//  ProfileDetailTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class ProfileDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var profileDashBoardStackView: UIStackView!
    @IBOutlet weak var profileImageTrailingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        profileImage.roundedImage()
        let screenWidth = UIScreen.main.bounds.width
        
        switch screenWidth {
        case 320:
            profileDashBoardStackView.spacing = 16
            profileImageTrailingConstraint.constant = 24
        default:
            profileDashBoardStackView.spacing = 40
            profileImageTrailingConstraint.constant = 40
        }
    }
}
