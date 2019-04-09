//
//  User.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/9/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import Foundation

struct User {
    private var _username: String
    private var _uid: String
    
    var uid : String {
        return _uid
    }
    
    var username : String {
        return _username
    }
    
    // manejo de variables que llegan desde firebase
    init(uid : String, firstName : String, lastName : String) {
        self._uid = uid
        self._username = "\(firstName) \(lastName)"
    }
}
