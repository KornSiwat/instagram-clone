//
//  Route.swift
//  Instagram
//
//  Created by Siwat Ponpued on 7/26/19.
//  Copyright © 2019 Siwat Ponpued. All rights reserved.
//

import Foundation

struct Route {
    static let baseUrl = "http://192.168.2.68:3000"

    static let profile = createPath("/profile")
    static let feed = createPath("/feed")
    static let notification = createPath("/notification")

    static func createPath(_ path: String) -> String {
        return baseUrl + path
    }
}
