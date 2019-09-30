//
//  Group.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//
//

import UIKit

struct Group {
    let name: String
    let avatar: UIImage?
}



struct Root : Codable {
    let count: Int
    let items: Items
}




struct Items: Codable {
    let id: Int
    let is_admin: Int
    let is_advertiser: Int
    let is_closed: Int
    let is_member: Int
    let name: String
    let photo_100: URL
    let photo_200: URL
    let photo_50: URL
    let screen_name: String
    let type: String
}
