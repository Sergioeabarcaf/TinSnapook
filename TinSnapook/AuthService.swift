//
//  AuthService.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/27/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import Foundation
import Firebase

class AuthService{
    private static let _shared = AuthService()
    
    static var shared: AuthService {
        return _shared
    }
    
    func login(email: String, password: String) {
        // hacer login
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = (error as NSError?) {
                // exite un error
                if let errorCode = AuthErrorCode(rawValue: error.code){
                    // en caso que el usuario no se encuentre, se creará un nuevo usuario
                    if errorCode == AuthErrorCode.userNotFound{
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (userCreate, errorCreate) in
                            // hubo un error en la creación del usuario
                            if errorCreate != nil {
                                // Mostrar error
                            } else {
                                // se inicia sesion con el usuario creado
                                if userCreate != nil {
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            print("hubo error al inciar sesion")
                                            // Mostrar error al usuario
                                        } else {
                                            print("login correcto con usuario nuevo")
                                            // El login al fin funciona
                                        }
                                    })
                                }
                            }
                        })
                        
                    }
                } else {
                    // revisar el resto de errores
                }
            } else {
                print("login correcto con usuario antiguo")
                // Se hizo el login de manera correcta
            }
        }
    }
}


