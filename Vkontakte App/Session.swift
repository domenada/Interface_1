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
    
    var token: String = ""
    var userId: Int = 10
   
}
