//
//  HighlightTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/5/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class HighlightTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: StoryUICollectionView!

    var highlights: [Highlight]?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - CollectionViewDelegate
extension HighlightTableViewCell: UICollectionViewDelegate { }

// MARK: - CollectionViewDataSource
extension HighlightTableViewCell: UICollectionViewDataSource {
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
extension HighlightTableViewCell {
    func configure(highlights: [Highlight]) {
        self.highlights = highlights
    }
}
