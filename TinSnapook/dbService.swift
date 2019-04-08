//
//  dbService.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/7/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import Foundation
import FirebaseDatabase

class dbService {
    private static let _shared = dbService()
    
    public static var shared: dbService {
        return _shared
    }
    
    var ref: DatabaseReference {
        return Database.database().reference()
    }
    
    func saveUser (uid: String) {
        // crear diccionario con nombre y apellido del usuario
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        
        // agregar diccionario creado a la ruta users/uid/profile/
        self.ref.child("users").child(uid).child("profile").setValue(profile)
        
    }
}
