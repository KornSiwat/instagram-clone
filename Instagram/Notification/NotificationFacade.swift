//
//  FollowingNotificationFacade.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/17/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

class NotificationFacade { }

// MARK: - Load NotificationFeed
extension NotificationFacade {
    func loadNotificationFeedPMK() -> Promise<NotificationFeed> {
        return Alamofire
            .request(Route.notification)
            .responseData()
            .map { dataResponse in
                let data = dataResponse.data
                let response = try JSONDecoder().decode(NotificationResponse.self, from: data)

                return NotificationFeed(response: response)
        }
    }
}
