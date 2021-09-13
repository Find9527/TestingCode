//
//  ViewController.swift
//  Foun
//
//  Created by Orange on 2021/9/4.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    @IBOutlet weak var previewView: UIView!
    
    @IBOutlet weak var captureImageView: UIImageView!
    
    var captureSession: AVCaptureSession!
    var captureInput: AVCaptureInput!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - 设置session
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        else {
            print("Unable to access back camera!")
            return
        }
        
        do {
            captureInput = try AVCaptureDeviceInput(device: backCamera)
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
        
        stillImageOutput = AVCapturePhotoOutput()
        
        if captureSession.canAddInput(captureInput) && captureSession.canAddOutput(stillImageOutput) {
            captureSession.addInput(captureInput)
            captureSession.addOutput(stillImageOutput)
            setupLivePreview()
        }

        
    }
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        previewView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            //Step 13
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.previewView.bounds
            }
        }
    }
        
    
    @IBAction func didTakePhoto(_ sender: Any) {
        
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                stillImageOutput.capturePhoto(with: settings, delegate: self)
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        captureImageView.image = image
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }


}

