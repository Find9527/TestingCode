//
//  Change.swift
//  TestObservedObject
//
//  Created by Orange on 2021/7/21.
//

import SwiftUI
import UIKit


struct RepresentView: UIViewRepresentable {
    
    let scrollview = UIScrollView()
    let swiftuiview = SwiftUIView()
    

       
    func makeUIView(context: Context) -> UIScrollView {
        
        scrollview.delegate = context.coordinator
        
        let contentview = UIView()
        let hostingController = UIHostingController(rootView: swiftuiview)
        hostingController.view.backgroundColor = UIColor.yellow
        

        
        contentview.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false


        scrollview.addSubview(contentview)
        contentview.addSubview(hostingController.view)
        

        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scrollview.topAnchor),
            contentview.leftAnchor.constraint(equalTo: scrollview.leftAnchor),
            contentview.rightAnchor.constraint(equalTo: scrollview.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            contentview.widthAnchor.constraint(equalTo: hostingController.view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: contentview.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostingController.view.widthAnchor.constraint(equalToConstant: 300),
            hostingController.view.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    
    typealias UIViewType = UIScrollView
    
    func makeCoordinator() -> RepresentView.Coordinate {
        Coordinator(self)
    }
    
    class Coordinate: NSObject, UIScrollViewDelegate {
       
        var parent: RepresentView

        init(_ paracontroller: RepresentView) {
            self.parent = paracontroller
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
           print("ncnn")
        }
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            print("start")
        }
    }    
}




struct RepresentView_Previews: PreviewProvider {
    static var previews: some View {
        RepresentView()
            .environmentObject(Model())
    }
}
