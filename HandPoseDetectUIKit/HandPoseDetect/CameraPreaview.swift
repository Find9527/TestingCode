//
//  CameraPreaview.swift
//  HandPoseDetect
//
//  Created by Orange on 2021/9/11.
//

import UIKit
import AVFoundation



class CameraPreview: UIView {
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    var previewLayer: AVCaptureVideoPreviewLayer {
        layer as! AVCaptureVideoPreviewLayer
    }
}

