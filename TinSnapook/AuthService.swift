//
//  AuthService.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/1/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService{
    private static let _shared = AuthService()
    
    static var shared : AuthService {
        return _shared
    }
    
    func login(email:String, password:String) {
        //hacer login
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = (error as NSError?) {
                // hay error
                if let errorCode = AuthErrorCode(rawValue: error.code){
                    if errorCode == AuthErrorCode.userNotFound {
                        //Crear usuario
                        Auth.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                //Mostrar error
                            } else {
                                if user.uid != nil {
                                    // hacer login usuario
                                }
                            }
                        })
                        
                    }
                }
            }
        }
    }
    
}
