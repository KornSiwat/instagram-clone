//
//  PostCollectionViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!

    var onPostImagePress: (() -> Void)?
}

// MARK: - Action
extension PostCollectionViewCell {
    @IBAction func postImagePress(_ sender: Any) {
        onPostImagePress!()
    }
}
