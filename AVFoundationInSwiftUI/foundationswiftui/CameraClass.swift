//
//  CameraClass.swift
//  CameraClass
//
//  Created by Orange on 2021/8/11.
//

import SwiftUI
import AVFoundation



class CameraClass {
    var captureSession : AVCaptureSession!
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    init() {
        self.previewLayer = setup()
    }
    
    func setup() -> AVCaptureVideoPreviewLayer? {
        
        self.captureSession = AVCaptureSession()
        
        guard let frontCamera = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("There is no camera")
            return nil
        }
        
        do {
            let captureInput = try AVCaptureDeviceInput(device: frontCamera)
            self.captureSession.addInput(captureInput)
        }catch let error {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
        
        return AVCaptureVideoPreviewLayer(session: captureSession)
        
    }
}

