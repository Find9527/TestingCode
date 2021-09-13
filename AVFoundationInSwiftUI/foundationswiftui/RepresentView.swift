//
//  RepresentView.swift
//  RepresentView
//
//  Created by Orange on 2021/8/11.
//

import SwiftUI

struct RepresentView: UIViewRepresentable {
    var camera = CameraClass()
    
    func makeUIView(context: Context) -> UIView {
        let uiview = UIView()
        uiview.backgroundColor = .gray
        if camera.previewLayer != nil {
            uiview.layer.addSublayer(camera.previewLayer!)
            DispatchQueue.global(qos: .userInitiated).async {
                camera.captureSession.startRunning()
                DispatchQueue.main.async {
                    camera.previewLayer!.frame = uiview.layer.bounds
                }
            }
        }
        
        
        
        return uiview
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    typealias UIViewType = UIView
   
}

struct RepresentView_Previews: PreviewProvider {
    static var previews: some View {
        RepresentView()
    }
}
