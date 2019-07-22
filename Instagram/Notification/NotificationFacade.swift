//
//  FollowingNotificationFacade.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Alamofire

class NotificationFacade {
    typealias LoadNotificationCompletion = (NotificationFeed?, Error?) -> Void
}

// MARK: - Load NotificationFeed
extension NotificationFacade {
    func loadNotificationFeed(completion: @escaping LoadNotificationCompletion) {
        let url = "http://192.168.2.68:3000/notification"

        Alamofire.request(url).responseData { response in
            do {
                switch response.result {
                case .success(let data):
                    let response = try JSONDecoder().decode(SelfInfoResponse.self, from: data)
                    let selfInfo = UserInfo(profileImageUrl: response.selfInfo.profileImageUrl,
                                            name: response.selfInfo.name,
                                            biography: response.selfInfo.biography,
                                            postCount: response.selfInfo.postCount,
                                            followerCount: response.selfInfo.followerCount,
                                            followingCount: response.selfInfo.followingCount)

                    let notifications: [Any] = response.notifications.map { (notification: SelfInfoResponse.Notification) in
                        switch notification.type {
                        case "Normal":
                            return NotificationNormalMessage(profileImageUrl: notification.profileImageUrl,
                                                             name: notification.name,
                                                             message: notification.message)
                        case "Follow":
                            return NotificationFollowMessage(profileImageUrl: notification.profileImageUrl,
                                                             name: notification.name,
                                                             message: notification.message,
                                                             isFollowing: notification.isFollowing!)
                        case "Like":
                            return NotificationLikeMessage(profileImageUrl: notification.profileImageUrl,
                                                           name: notification.name,
                                                           message: notification.message,
                                                           likedPost: Post(profileImageUrl: notification.likedPost!.profileImageUrl,
                                                                           profileName: notification.likedPost!.profileName,
                                                                           postImageUrl: notification.likedPost!.postImageUrl))
                        default:
                            return 1
                        }
                    }

                    let followingActivities: [NotificationLikeMessage] = response.followingActivities
                        .map { (activity: SelfInfoResponse.FollowingActivity) in
                            return NotificationLikeMessage(profileImageUrl: activity.profileImageUrl,
                                                           name: activity.name,
                                                           message: activity.message,
                                                           likedPost: Post(profileImageUrl: activity.likedPost!.profileImageUrl,
                                                                           profileName: activity.likedPost!.profileName,
                                                                           postImageUrl: activity.likedPost!.postImageUrl))
                    }
                    
                    let notificationFeed = NotificationFeed(selfInfo: selfInfo,
                                                            followingActivities: followingActivities,
                                                            notifications: notifications)
                    

                    completion(notificationFeed, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            } catch {
                print(error)
            }
        }
    }

    struct SelfInfoResponse: Decodable {
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

        struct SelfInfo: Decodable {
            let profileImageUrl: URL
            let name: String
            let biography: String
            let postCount: Int
            let followerCount: Int
            let followingCount: Int
        }

        struct Notification: Decodable {
            let type: String
            let profileImageUrl: URL
            let name: String
            let message: String
            let isFollowing: Bool?
            let likedPost: Post?
        }

        struct FollowingActivity: Decodable {
            let type: String
            let profileImageUrl: URL
            let name: String
            let message: String
            let likedPost: Post?
        }

        let selfInfo: SelfInfo
        let notifications: [Notification]
        let followingActivities: [FollowingActivity]
    }
}
