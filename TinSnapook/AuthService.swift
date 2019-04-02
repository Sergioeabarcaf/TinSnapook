//
//  AuthService.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/1/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errorMessage: String?, _ data: AnyObject?) -> Void

class AuthService{
    private static let _shared = AuthService()
    
    static var shared : AuthService {
        return _shared
    }
    
    func login(email:String, password:String, onComplete: @escaping Completion) {
        //hacer login
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = (error as NSError?) {
                // hay error
                if let errorCode = AuthErrorCode(rawValue: error.code){
                    if errorCode == AuthErrorCode.userNotFound {
                        //Crear usuario
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if let error = (error as NSError?) {
                                //manipular error
                                self.handleFirebaseError(error: error, onComplete: onComplete)
                            } else {
                                if user?.user.uid != nil {
                                    // hacer login usuario
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if let error = (error as NSError?) {
                                            self.handleFirebaseError(error: error, onComplete: onComplete)
                                        } else {
                                            //Se completa el login
                                            onComplete(nil, user!)
                                        }
                                    })
                                }
                            }
                        })
                        
                    } else {
                        //Manejar el resto de errores
                        self.handleFirebaseError(error: error, onComplete: onComplete)
                    }
                }
            } else {
                //login correcto
                onComplete(nil, user!)
            }
        }
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch(errorCode){
            case .invalidEmail:
                onComplete!("Email incorrecto", nil)
                break
            case .wrongPassword, .invalidCredential, .accountExistsWithDifferentCredential:
                onComplete!("Contraseña incorrecta", nil)
                break
            case .userDisabled:
                onComplete!("Este usuario no tiene permisos para entrar", nil)
                break
            case .emailAlreadyInUse:
                onComplete!("No se ha podido crear la cuenta este Email ya esta registrado", nil)
                break
            case .weakPassword:
                onComplete!("Contraseña demaciado debil", nil)
                break
            default:
                onComplete!("Ha habido un problema para entrar, intenta nuevamente", nil)
            }
            
        }
    }
    
}
