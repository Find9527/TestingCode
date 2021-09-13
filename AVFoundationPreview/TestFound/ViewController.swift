//
//  ViewController.swift
//  TestFound
//
//  Created by Orange on 2021/9/5.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    
    var session: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        //MARK: - 1. CREAT AVCaptureSession
        session = AVCaptureSession()
        
        //MARK: - 2. ADD INPUT
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        else {
            print("Unable to access back camera!")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            session.addInput(input)
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
        
        //MARK: - 3. ADD PREVIEW TO VIEW
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        self.view.layer.addSublayer(videoPreviewLayer)
        //previewView.layer.addSublayer(videoPreviewLayer)

        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.session.startRunning()
            DispatchQueue.main.async {
                //self.videoPreviewLayer.frame = self.previewView.bounds
                self.videoPreviewLayer.frame = self.view.bounds
            }
        }
        
        
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.session.stopRunning()
    }


}

