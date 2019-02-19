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
    
    
    @IBOutlet weak var captureModeControl: UISegmentedControl!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraUnavailableLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var livePhotoModeButton: UIButton!
    @IBOutlet weak var depthDataDeliveryButton: UIButton!
    @IBOutlet weak var portraitEffectsMatteDeliveryButton: UIButton!
    @IBOutlet weak var capturingLivePhotoLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    
    override func viewDidLoad() {
        super._previewView = self.previewView
        
        super._captureModeControl = self.captureModeControl
        super._cameraButton = self.cameraButton
        super._cameraUnavailableLabel = self.cameraUnavailableLabel
        super._photoButton = self.photoButton
        super._livePhotoModeButton = self.livePhotoModeButton
        super._depthDataDeliveryButton = self.depthDataDeliveryButton
        super._portraitEffectsMatteDeliveryButton = self.portraitEffectsMatteDeliveryButton
        super._capturingLivePhotoLabel = self.capturingLivePhotoLabel
        super._recordButton = self.recordButton
        super._resumeButton = self.resumeButton
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

