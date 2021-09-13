//
//  VCVision.swift
//  HandPoseDetect
//
//  Created by Orange on 2021/9/11.
//

import UIKit
import AVFoundation
import Vision

extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        var fingerTips:[CGPoint] = []
        
        defer {
          DispatchQueue.main.sync {
            self.processPoints(fingerTips)
          }
        }
        
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
        
        do {
            try handler.perform([handPoseRequest])
            
            guard let results = handPoseRequest.results?.prefix(2) else {
                return
            }
            
            var recognizedPoints: [VNRecognizedPoint] = []
            
            try results.forEach { observation in
                let fingers = try observation.recognizedPoints(.all)
                if let thumbTipPoint = fingers[.thumbTip] {
                    recognizedPoints.append(thumbTipPoint)
                  }
                  if let indexTipPoint = fingers[.indexTip] {
                    recognizedPoints.append(indexTipPoint)
                  }
                  if let middleTipPoint = fingers[.middleTip] {
                    recognizedPoints.append(middleTipPoint)
                  }
                  if let ringTipPoint = fingers[.ringTip] {
                    recognizedPoints.append(ringTipPoint)
                  }
                  if let littleTipPoint = fingers[.littleTip] {
                    recognizedPoints.append(littleTipPoint)
                  }
            }
            
            
            fingerTips = recognizedPoints.filter {
                $0.confidence > 0.9
            }
            .map {  //将vision坐标转换为AVfoundation坐标
                CGPoint(x: $0.location.x, y: 1 - $0.location.y)
            }
            
            
        } catch {
            captureSession?.stopRunning()
        }
    }
    
    
    func processPoints(_ fingerTips: [CGPoint]) -> [CGPoint]{
        let convertedPoints = fingerTips.map {
            cameraView.previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        return convertedPoints
    }
    
}
