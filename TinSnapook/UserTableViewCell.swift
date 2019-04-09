//
//  UserTableViewCell.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 4/8/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Al iniciar se deseleccionan todas las celdas
        setCheckMark(selected: false)
        // Initialization code
    }
    
    // Seleccionar imagen segun seleccion de usuario
    func setCheckMark(selected: Bool) {
        let image = selected ? #imageLiteral(resourceName: "Hola-1") : #imageLiteral(resourceName: "Hola")
        self.accessoryView = UIImageView(image: image)
    }
    
    // Modificar label con username de firebase
    func updateUserUI(user: User){
        self.userNameLabel.text = user.username
    }
    
    


}
