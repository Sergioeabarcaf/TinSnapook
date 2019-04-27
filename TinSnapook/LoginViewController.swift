//
//  LoginViewController.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 3/10/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: RoundTextField!
    @IBOutlet weak var passTextField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passTextField.text, (email.count > 0 && pass.count > 0) {
            // Derivar login a AuthService
            AuthService.shared.login(email: email, password: pass)
        } else {
            let alert = UIAlertController(title: "Usuario y contraseñas incorrectos", message: "Favor de volver a ingresar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    
    
    
    //MARK: textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
