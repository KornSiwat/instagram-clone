//
//  UserProfilePostTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserProfilePostTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UserProfilePostCollectionView!
    @IBOutlet weak var collectionViewWidth: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!

    var heightOfCell: CGFloat = 0
    var onPostImagePress: OnPostImagePress?

    var selfInfo: UserInfo?
    var posts: [Post]? {
        didSet {
            updateView()
        }
    }
}

// MARK: Update
extension UserProfilePostTableViewCell {
    func updateView() {
        updateCollectionView()
        collectionView.reloadData()
    }

    func updateCollectionView() {
        collectionViewWidth.constant = UIScreen.main.bounds.width
        collectionViewHeight.constant = heightOfCell
        layoutIfNeeded()
    }
}

// MARK: UICollectionViewDelegate
extension UserProfilePostTableViewCell: UICollectionViewDelegate { }

// MARK: UICollectionViewDataSource
extension UserProfilePostTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "PostCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! UserProfilePostCollectionViewCell
        let post = posts![indexPath.row]

        cell.configure(post: post,
                       onPostImagePress: { self.onPostImagePress!(self.selfInfo!, post) })

        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension UserProfilePostTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageWidth = (UIScreen.main.bounds.width / 3)

        return CGSize(width: imageWidth,
                      height: imageWidth)
    }
}

// MARK: Configure
extension UserProfilePostTableViewCell {
    func configure(cellHeight: CGFloat,
                   selfInfo: UserInfo,
                   posts: [Post],
                   onPostImagePress: @escaping OnPostImagePress) {
        self.onPostImagePress = onPostImagePress
        self.heightOfCell = cellHeight
        self.selfInfo = selfInfo
        self.posts = posts
    }
}
