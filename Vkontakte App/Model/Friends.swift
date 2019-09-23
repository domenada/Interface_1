//
//  Friends.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage?
    let photos: [UIImage]

    static func generateFriends() -> [User] {
        return [
            User (name: "Angela Merkel", avatar: UIImage(named: "Angela"), photos: generateFriendPhotos()),
            User (name: "Donald Trump", avatar: UIImage(named: "Donald"), photos: generateFriendPhotos()),
            User (name: "Justin Trudeau", avatar: UIImage(named: "Justin"), photos: generateFriendPhotos()),
            User (name: "Vladimir Putin", avatar: UIImage(named: "Vladimir"), photos: generateFriendPhotos()),
            User (name: "Shinzo Abe", avatar: UIImage(named: "Shinzo"), photos: generateFriendPhotos()),
            User (name: "Paolo Gentiloni", avatar: UIImage(named: "Paolo"), photos: generateFriendPhotos())
        ]
    
    }
    
    static func generateFriendPhotos () -> [UIImage] {
        let images = [
            UIImage(named: "Angela")!,
            UIImage(named: "Donald")!,
            UIImage(named: "Justin")!,
            UIImage(named: "Vladimir")!,
            UIImage(named: "Shinzo")!,
            UIImage(named: "Paolo")!]
        
        let count = Int.random(in: 4...8)
        var resultArray = [UIImage]()
        for _ in 0...count {
            resultArray.append(images.randomElement()!)
        }
        return resultArray
    }
}
