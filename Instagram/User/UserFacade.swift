//
//  UserFacade.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/18/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit

class UserFacade {
    func loadProfile() -> UserProfile {
        return UserProfile(selfInfo: loadSelfInfo(),
                           highlights: loadSampleHighlight(),
                           posts: loadSamplePost())
    }
    
    func loadFeed() -> UserFeed {
        return UserFeed(selfInfo: loadSelfInfo(),
                        stories: loadStories(),
                        posts: loadPosts())
    }
}

// MARK: - Load SelfInfo
extension UserFacade {
    func loadSelfInfo() -> UserInfo {
        return UserInfo(profileImage: UIImage(named: "salahProfile")!,
                        name: "kkornsw",
                        biography: "Liverpool Big Fan",
                        postCount: 59,
                        followerCount: 512,
                        followingCount: 203)
    }
}

// MARK: - Load Highlight
private extension UserFacade {
    func loadSampleHighlight() -> [UserProfileHighlight] {
        return [
            UserProfileHighlight(image: UIImage(named: "maneProfile")!,
                                 name: "mane"),
            UserProfileHighlight(image: UIImage(named: "firminoProfile")!,
                                 name: "firmino"),
            UserProfileHighlight(image: UIImage(named: "liverpoolProfile")!,
                                 name: "liverpool")
        ]
    }
}

// MARK: - Load Post
private extension UserFacade {
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
                    PostComment(profileName: "mane",
                                profileImage: UIImage(named: "maneProfile"),
                                message: "Nice View"),
                    PostComment(profileName: "salah",
                                profileImage: UIImage(named: "salahProfile"),
                                message: "eiei"),
                    PostComment(profileName: "salah",
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
                    PostComment(profileName: "salah",
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

// MARK: - Load Story Data
extension UserFacade {
    func loadStories() -> [Story] {
        let followingStories = loadFollowingUserStories() ?? loadSampleFollowingUserStories()
        
        return [loadSelfStory()] + followingStories
    }
    
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
extension UserFacade {
    func loadPosts() -> [Post] {
        return nil ?? loadSamplePosts()
    }
    
    func loadSamplePosts() -> [Post] {
        let samplePostDetails = [
            (
                profileImage: "defaultProfileImage",
                name: "kkornsw",
                location: "Bangkok Thailand",
                postImage: "defaultPostImage",
                isLiked: true,
                likeCount: 1,
                caption: "Born To Code",
                comments: [
                    PostComment(profileName: "mane",
                                profileImage: UIImage(named: "maneProfile"),
                                message: "Nice View"),
                    PostComment(profileName: "salah",
                                profileImage: UIImage(named: "salahProfile"),
                                message: "eiei"),
                    PostComment(profileName: "salah",
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
                    PostComment(profileName: "salah",
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

