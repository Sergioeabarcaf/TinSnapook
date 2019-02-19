//
//  ViewController.swift
//  TinSnapook
//
//  Created by Sergio Abarca Flores on 2/19/19.
//  Copyright © 2019 sergioeabarcaf. All rights reserved.
//

import UIKit

class MainCameraViewController: CameraViewController {

    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
        super._previewView = self.previewView
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

