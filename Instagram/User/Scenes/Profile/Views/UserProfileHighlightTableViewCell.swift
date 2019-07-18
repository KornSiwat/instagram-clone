//
//  UserProfileHighlightTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserProfileHighlightTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: StoryCollectionView!

    var highlights: [UserProfileHighlight]?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - CollectionViewDelegate
extension UserProfileHighlightTableViewCell: UICollectionViewDelegate { }

// MARK: - CollectionViewDataSource
extension UserProfileHighlightTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return highlights!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "StoryCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! StoryCollectionViewCell
        let highlight = highlights![indexPath.row]
        
        cell.profileImage.image = highlight.image
        cell.profileName.text = highlight.name
        
        return cell
    }
}

// MARK: - Configure
extension UserProfileHighlightTableViewCell {
    func configure(highlights: [UserProfileHighlight]) {
        self.highlights = highlights
    }
}
