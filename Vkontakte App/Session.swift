//
//  Session.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 9/15/19.
//  Copyright © 2019 light. All rights reserved.
//

import Foundation
class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token: String = "bba2b2d0bea79de9b6090a1b4c40ba2a26fcb51df2297e8aacd5f8f2e1876ec7c6cfc33a19ca7e18f0724"
    var userId: Int = 0
   
}
