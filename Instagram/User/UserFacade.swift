//
//  UserFacade.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/18/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

class UserFacade {
    typealias LoadProfileCompletion = (UserProfile?, Error?) -> Void
    typealias LoadFeedCompletion = (UserFeed?, Error?) -> Void
}

// MARK: - Load Profile Data
extension UserFacade {
    func loadProfile(completion: @escaping LoadProfileCompletion) {
        let url = "http://192.168.2.68:3000/profile"

        Alamofire.request(url).responseData { response in
            do {
                switch response.result {
                case .success(let data):
                    let response = try JSONDecoder().decode(ProfileResponse.self, from: data)
                    let selfInfo = UserInfo(profileImageUrl: response.selfInfo.profileImageUrl,
                                            name: response.selfInfo.name,
                                            biography: response.selfInfo.biography,
                                            postCount: response.selfInfo.postCount,
                                            followerCount: response.selfInfo.followerCount,
                                            followingCount: response.selfInfo.followingCount)

                    let highlights = response.highlights
                        .map { (highlight: ProfileResponse.Highlight) in
                            return UserProfileHighlight(previewImageUrl: highlight.previewImageUrl,
                                                        name: highlight.name)
                    }

                    let posts = response.posts
                        .map { (post: ProfileResponse.Post) in
                            return Post(profileImageUrl: post.profileImageUrl,
                                        profileName: post.profileName,
                                        location: post.location!,
                                        postImageUrl: post.postImageUrl,
                                        isLiked: post.isLiked!,
                                        likeCount: post.likeCount!,
                                        caption: post.caption!,
                                        comments: post.comments!.map { (comment: ProfileResponse.Post.PostComment) in
                                            return PostComment(profileName: comment.profileName,
                                                               profileImageUrl: comment.profileImageUrl,
                                                               message: comment.message)
                            })
                    }
                    
                    let profile = UserProfile(selfInfo: selfInfo,
                                              highlights: highlights,
                                              posts: posts)

                    completion(profile, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            } catch {
                print(error)
            }
        }
    }

    struct ProfileResponse: Decodable {
        struct SelfInfo: Decodable {
            let profileImageUrl: URL
            let name: String
            let biography: String
            let postCount: Int
            let followerCount: Int
            let followingCount: Int
        }

        struct Highlight: Decodable {
            let previewImageUrl: URL
            let name: String
        }

        struct Post: Decodable {
            struct PostComment: Decodable {
                let profileName: String
                let profileImageUrl: URL
                let message: String
            }

            let profileImageUrl: URL
            let profileName: String
            let location: String?
            let isLiked: Bool?
            let likeCount: Int?
            let caption: String?
            let comments: [PostComment]?
            let postImageUrl: URL
        }

        let selfInfo: SelfInfo
        let highlights: [Highlight]
        let posts: [Post]
    }
}

extension UserFacade {
    func loadFeedPMK() -> Promise<UserFeed> {
        let url = "http://192.168.2.68:3000/feed"
        return Alamofire
            .request(url)
            .responseData()
            .map { dataResponse in
                let data = dataResponse.data
                let response = try JSONDecoder().decode(FeedResponse.self, from: data)
                let selfInfo = UserInfo(profileImageUrl: response.selfInfo.profileImageUrl,
                                        name: response.selfInfo.name,
                                        biography: response.selfInfo.biography,
                                        postCount: response.selfInfo.postCount,
                                        followerCount: response.selfInfo.followerCount,
                                        followingCount: response.selfInfo.followingCount)
                
                let stories = response.stories
                    .map { (story: FeedResponse.Story) in
                        return Story(previewImageUrl: story.previewImageUrl,
                                     name: story.name)
                }
                
                let posts = response.posts
                    .map { (post: FeedResponse.Post) in
                        return Post(profileImageUrl: post.profileImageUrl,
                                    profileName: post.profileName,
                                    location: post.location!,
                                    postImageUrl: post.postImageUrl,
                                    isLiked: post.isLiked!,
                                    likeCount: post.likeCount!,
                                    caption: post.caption!,
                                    comments: post.comments!.map { (comment: FeedResponse.Post.PostComment) in
                                        return PostComment(profileName: comment.profileName,
                                                           profileImageUrl: comment.profileImageUrl,
                                                           message: comment.message)
                        })
                }
                
                let feed = UserFeed(selfInfo: selfInfo,
                                    stories: stories,
                                    posts: posts)
                
                return feed
            }
    }
    
    func loadFeed(completion: @escaping LoadFeedCompletion) {
        let url = "http://192.168.2.68:3000/feed"
        
        Alamofire.request(url).responseData { response in
            do {
                switch response.result {
                case .success(let data):
                    let response = try JSONDecoder().decode(FeedResponse.self, from: data)
                    let selfInfo = UserInfo(profileImageUrl: response.selfInfo.profileImageUrl,
                                            name: response.selfInfo.name,
                                            biography: response.selfInfo.biography,
                                            postCount: response.selfInfo.postCount,
                                            followerCount: response.selfInfo.followerCount,
                                            followingCount: response.selfInfo.followingCount)
                    
                    let stories = response.stories
                        .map { (story: FeedResponse.Story) in
                            return Story(previewImageUrl: story.previewImageUrl,
                                         name: story.name)
                    }
                    
                    let posts = response.posts
                        .map { (post: FeedResponse.Post) in
                            return Post(profileImageUrl: post.profileImageUrl,
                                        profileName: post.profileName,
                                        location: post.location!,
                                        postImageUrl: post.postImageUrl,
                                        isLiked: post.isLiked!,
                                        likeCount: post.likeCount!,
                                        caption: post.caption!,
                                        comments: post.comments!.map { (comment: FeedResponse.Post.PostComment) in
                                            return PostComment(profileName: comment.profileName,
                                                               profileImageUrl: comment.profileImageUrl,
                                                               message: comment.message)
                            })
                    }
                    
                    let feed = UserFeed(selfInfo: selfInfo,
                                              stories: stories,
                                              posts: posts)
                    
                    completion(feed, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            } catch {
                print(error)
            }
        }
    }
    
    struct FeedResponse: Decodable {
        struct SelfInfo: Decodable {
            let profileImageUrl: URL
            let name: String
            let biography: String
            let postCount: Int
            let followerCount: Int
            let followingCount: Int
        }
        
        struct Story: Decodable {
            let previewImageUrl: URL
            let name: String
        }
        
        struct Post: Decodable {
            struct PostComment: Decodable {
                let profileName: String
                let profileImageUrl: URL
                let message: String
            }
            
            let profileImageUrl: URL
            let profileName: String
            let location: String?
            let isLiked: Bool?
            let likeCount: Int?
            let caption: String?
            let comments: [PostComment]?
            let postImageUrl: URL
        }
        
        let selfInfo: SelfInfo
        let stories: [Story]
        let posts: [Post]
    }
}

