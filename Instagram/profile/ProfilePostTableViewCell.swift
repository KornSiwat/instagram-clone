//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class ProfilePostTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: PostCollectionView!
    @IBOutlet weak var collectionViewWidth: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    var posts: [Post]?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Setup
extension ProfilePostTableViewCell {
    func setupCollectionView() {
        let imageWidth = UIScreen.main.bounds.width / 3
        collectionViewWidth.constant = UIScreen.main.bounds.width
        collectionViewHeight.constant = imageWidth * CGFloat((posts!.count / 3))
    }
}

// MARK: UICollectionViewDelegate
extension ProfilePostTableViewCell: UICollectionViewDelegate { }

// MARK: UICollectionViewDataSource
extension ProfilePostTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        setupCollectionView()
        return posts!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "PostCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        as! PostCollectionViewCell
        let post = posts![indexPath.row]

        cell.image.image = post.postImage

        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ProfilePostTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageWidth = (UIScreen.main.bounds.width / 3)

        return CGSize(width: imageWidth, height: imageWidth)
    }
}
