//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/3/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    var stories: [Story]?

    @IBOutlet weak var collectionView: StoryCollectionView!
}

// MARK: - UICollectionViewDelegate
extension StoryTableViewCell: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource
extension StoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "StoryCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        as! StoryCollectionViewCell
        let story = stories![indexPath.row]

        cell.configure(story: story)

        return cell
    }
}
