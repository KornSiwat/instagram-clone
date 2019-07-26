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
    func loadProfilePMK() -> Promise<UserProfile> {
        return Alamofire
            .request(Route.profile)
            .responseData()
            .map { dataResponse in
                let data = dataResponse.data
                let response = try JSONDecoder().decode(ProfileResponse.self, from: data)

                return UserProfile(response: response)
        }
    }
}

extension UserFacade {
    func loadFeedPMK() -> Promise<UserFeed> {        
        return Alamofire
            .request(Route.feed)
            .responseData()
            .map { dataResponse in
                let data = dataResponse.data
                let response = try JSONDecoder().decode(FeedResponse.self, from: data)

                return UserFeed(response: response)
        }
    }
}

