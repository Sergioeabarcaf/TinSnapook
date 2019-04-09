//
//  dbService.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/7/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

// Constante
let FB_CHILD_USERS = "users"

import Foundation
import FirebaseDatabase

class dbService {
    private static let _shared = dbService()
    
    public static var shared: dbService {
        return _shared
    }
    
    // Referencia principal a firebase
    var ref: DatabaseReference {
        return Database.database().reference()
    }
    
    // Referencia a los usuarios de firebase
    var userRef : DatabaseReference {
        return ref.child(FB_CHILD_USERS)
    }
    
    // Función para guardar el nombre y apellido de un usuario
    func saveUser (uid: String) {
        // crear diccionario con nombre y apellido del usuario
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        
        // agregar diccionario creado a la ruta users/uid/profile/
        self.ref.child(FB_CHILD_USERS).child(uid).child("profile").setValue(profile)
        
    }
    
}
