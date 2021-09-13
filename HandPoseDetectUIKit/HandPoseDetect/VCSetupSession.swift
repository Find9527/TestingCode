//
//  VCSetupSession.swift
//  HandPoseDetect
//
//  Created by Orange on 2021/9/11.
//

import UIKit
import AVFoundation


extension ViewController {
    
    public func setupAVSession() throws {
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            throw AppError.captureSessionSetup(
                  reason: "Could not find a front facing camera."
                )
        }
        
        guard let deviceInput = try? AVCaptureDeviceInput(device: device) else {
            throw AppError.captureSessionSetup(
                  reason: "Could not create video device input."
                )
        }
        
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = .high
        
        guard session.canAddInput(deviceInput) else {
            throw AppError.captureSessionSetup(
                  reason: "Could not add video device input to the session"
                )
        }
        session.addInput(deviceInput)
        
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
            session.addOutput(dataOutput)
            dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            throw AppError.captureSessionSetup(
                  reason: "Could not add video data output to the session"
                )
        }
        
        session.commitConfiguration()
        captureSession = session
    }
}
