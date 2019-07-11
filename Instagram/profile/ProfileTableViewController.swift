//
//  ProfileTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/1/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    let selfInfo = UserInfo(profileImage: UIImage(named: "salahProfile")!,
                            name: "kkornsw",
                            biography: "Liverpool Big Fan",
                            postCount: 59,
                            followerCount: 512,
                            followingCount: 203)
    let selfHighlights = [
        Highlight(image: UIImage(named: "maneProfile")!,
                  name: "mane"),
        Highlight(image: UIImage(named: "firminoProfile")!,
                  name: "firmino"),
        Highlight(image: UIImage(named: "liverpoolProfile")!,
                  name: "liverpool")
    ]

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        posts = loadSamplePost()
    }
}

// MARK: - UIScrollViewDelegate
extension ProfileTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let postCell = tableView.visibleCells.last as! ProfilePostTableViewCell
        if scrollView.contentOffset.y >= 203 {
            postCell.collectionView.isScrollEnabled = true

        } else {
            postCell.collectionView.isScrollEnabled = false
        }
    }
}

// MARK: - Table view data source
extension ProfileTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellIdentifier = "ProfileDetailCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProfileDetailTableViewCell

            cell.userInfo = selfInfo

            return cell
        case 1:
            let cellIdentifier = "HighlightCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HighlightTableViewCell

            cell.highlights = selfHighlights

            return cell
        default:
            let cellIdentifier = "ProfilePostTableCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProfilePostTableViewCell

            cell.heightOfCell = tableView.frame.height
            cell.posts = posts
            cell.onPostImagePress = onPostImagePress

            return cell
        }
    }
}

// MARK: - Load Post Data
extension ProfileTableViewController {
    func loadSamplePost() -> [Post] {
        let samplePostDetails = [
            (
                profileImage: "defaultProfileImage",
                name: "kkornsw",
                location: "Bangkok Thailand",
                postImage: "defaultPostImage",
                isLiked: true,
                likeCount: 0,
                caption: "Born To Code",
                comments: [
                    Comment(profileName: "mane",
                            profileImage: UIImage(named: "maneProfile"),
                            message: "Nice View"),
                    Comment(profileName: "salah",
                            profileImage: UIImage(named: "salahProfile"),
                            message: "eiei"),
                    Comment(profileName: "salah",
                            profileImage: UIImage(named: "salahProfile"),
                            message: "yay")
                ]
            ),
            (
                profileImage: "salahProfile",
                name: "mohamed_salah",
                location: "Egypt",
                postImage: "salah",
                isLiked: false,
                likeCount: 999,
                caption: "Egyptian King",
                comments: []
            ),
            (
                profileImage: "maneProfile",
                name: "mane",
                location: "",
                postImage: "mane",
                isLiked: false,
                likeCount: 872,
                caption: "Best Winger",
                comments: [
                    Comment(profileName: "salah",
                            profileImage: UIImage(named: "salahProfile"),
                            message: "you did very well this season")
                ]
            ),
            (
                profileImage: "firminoProfile",
                name: "roberto_firmino",
                location: "Anfield",
                postImage: "firmino",
                isLiked: false,
                likeCount: 798,
                caption: "Best Number 9",
                comments: []
            ),
            (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ),
            (
                profileImage: "allezProfile",
                name: "allezallez",
                location: "unknown",
                postImage: "allez",
                isLiked: false,
                likeCount: 11,
                caption: "We're tha champion",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ), (
                profileImage: "liverpoolProfile",
                name: "liverpool_fc",
                location: "Anfield",
                postImage: "liverpool",
                isLiked: false,
                likeCount: 423,
                caption: "Great Players",
                comments: []
            ),
        ]

        return samplePostDetails.map { Post(profileImage: UIImage(named: $0.profileImage)!,
                                            name: $0.name,
                                            location: $0.location,
                                            postImage: UIImage(named: $0.postImage)!,
                                            isLiked: $0.isLiked,
                                            likeCount: $0.likeCount,
                                            caption: $0.caption,
                                            comments: $0.comments)
        }
    }
}

// MARK: - Navigation
extension ProfileTableViewController {
    func onPostImagePress(post: Post) -> (() -> Void) {
        return { self.performSegue(withIdentifier: "PostSegue", sender: post) }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PostViewController
        let post = sender as! Post
        
        destination.selfInfo = selfInfo
        destination.post = post
    }
}
