//
//  ViewController.swift
//  HandPoseDetect
//
//  Created by Orange on 2021/9/11.
//

import UIKit
import AVFoundation
import Vision

class ViewController: UIViewController {
    
    var captureSession: AVCaptureSession?
    let videoDataOutputQueue = DispatchQueue(
      label: "CameraFeedOutput",
      qos: .userInteractive
    )
    let handPoseRequest: VNDetectHumanHandPoseRequest = {
      let request = VNDetectHumanHandPoseRequest()
      request.maximumHandCount = 2
      return request
    }()
    
    
    override func loadView() {
        view = CameraPreview()
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }
    var cameraView: CameraPreview { view as! CameraPreview }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            if captureSession == nil {
                try setupAVSession()
                cameraView.previewLayer.session = captureSession
                cameraView.previewLayer.videoGravity = .resizeAspectFill
            }
            captureSession?.startRunning()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        captureSession?.stopRunning()
    }


}

enum AppError: Error {
  case captureSessionSetup(reason: String)
}
