//
//  HomeTableViewController.swift
//  Instagram
//
//  Created by Siwat Ponpued on 6/30/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var selfInfo: UserInfo = UserInfo(name: "kkornsw",
                                      profileImage: UIImage(named: "salahProfile")!)
    var stories: [Story] = []
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStories()
        setupPosts()
        
//        tabBarController!.tabBar.isHidden = false
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tabBarController!.tabBar.isHidden = false
//    }
}

// MARK: - Setup
extension HomeTableViewController {
    func setupStories() {
        let selfStory = loadSelfStory()
        let followingUserStories = loadFollowingUserStories() ?? loadSampleFollowingUserStories()

        stories = [selfStory] + followingUserStories
    }

    func setupPosts() {
        posts = loadPost() ?? loadSamplePost()
    }
}

// MARK: - Table Action
extension HomeTableViewController {
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}

// MARK: - Load Story Data
extension HomeTableViewController {
    func loadSelfStory() -> Story {
        return Story(name: "Your Story", image: UIImage(named: "defaultProfilePicture"))
    }

    func loadFollowingUserStories() -> [Story]? {
        return nil
    }

    func loadSampleFollowingUserStories() -> [Story] {
        let sampleStoryDetails = [
            (name: "liverpool", image: "liverpoolProfile"),
            (name: "mane", image: "maneProfile"),
            (name: "firmino", image: "firminoProfile"),
            (name: "salah", image: "salahProfile")
        ]

        return sampleStoryDetails.map { Story(name: $0.name,
                                              image: UIImage(named: $0.image)) }
    }
}

// MARK: - Load Post Data
extension HomeTableViewController {
    func loadPost() -> [Post]? {
        return nil
    }

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
            )
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

// MARK: - UITableViewDataSource
extension HomeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return posts.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellIdentifier = "StoryCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! StoryTableViewCell

            cell.stories = stories

            return cell
        default:
            let cellIdentifier = "PostCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! PostTableViewCell

            let post = posts[indexPath.row]

            cell.headerImage.image = post.profileImage
            cell.profileName.text = post.name
            cell.location.text = post.location
            cell.postImage.image = post.postImage
            cell.isLiked = post.isLiked
            cell.likeCount.text = "\(post.likeCount)"
            cell.caption = post.caption

            cell.location.isHidden = cell.location.text!.isEmpty
            cell.likeBar.isHidden = post.likeCount == 0

            cell.onLike = {
                post.isLiked = !post.isLiked
                if post.isLiked {
                    post.likeCount += 1
                } else {
                    post.likeCount -= 1
                }

                tableView.reloadRows(at: [indexPath], with: .none)
            }

            cell.onCommentPress = {
                self.performSegue(withIdentifier: "CommentSegue", sender: post)
            }

            return cell
        }
    }
}

// MARK: - Navigation
extension HomeTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CommentViewController
        let post = sender as! Post
        let comments = post.comments

        destination.selfInfo = selfInfo
        destination.comments = comments
        destination.updateCommentsData = { comments in
            post.comments = comments
        }

//        tabBarController!.tabBar.isHidden = true
    }
}
