//
//  Change.swift
//  TestObservedObject
//
//  Created by Orange on 2021/7/21.
//

import SwiftUI
import UIKit


struct RepresentView: UIViewControllerRepresentable {
    let viewcontroller = UIViewController()
    let scrollview = UIScrollView()
    @State var width:CGFloat = 0
    
        
    func makeUIViewController(context: Context) -> UIViewController {
        
        let contentview = UIView()
        let hostingController = UIHostingController(rootView: SwiftUIView())
        hostingController.view.backgroundColor = UIColor.yellow
        
        viewcontroller.view.backgroundColor = UIColor.gray

        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        contentview.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        scrollview.delegate = context.coordinator

        viewcontroller.view.addSubview(scrollview)
        scrollview.addSubview(contentview)
        contentview.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: viewcontroller.view.topAnchor),
            scrollview.leftAnchor.constraint(equalTo: viewcontroller.view.leftAnchor),
            scrollview.rightAnchor.constraint(equalTo: viewcontroller.view.rightAnchor),
            scrollview.bottomAnchor.constraint(equalTo: viewcontroller.view.bottomAnchor)
        ])

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
            hostingController.view.widthAnchor.constraint(equalToConstant: 3000),
            hostingController.view.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(Coordinate.pinchGestureFun(_:)))
        contentview.addGestureRecognizer(pinchGesture)
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(Coordinate.longPressFun(_:)))
        lpgr.minimumPressDuration = 0.5
        
        return viewcontroller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
    func dododo() {
        print("long")
    }
    
    typealias UIViewControllerType = UIViewController
    
// MARK: -
    
    func makeCoordinator() -> RepresentView.Coordinate {
        Coordinator(self)
    }
    
    class Coordinate: NSObject, UIScrollViewDelegate {
       
        var parent: RepresentView

        init(_ parent: RepresentView) {
            self.parent = parent
        }
        
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {

            
        }
        
        @objc func pinchGestureFun(_ recognizer:UIPinchGestureRecognizer) {
            print("pinch")
        }
        
        @objc func longPressFun(_ recognizer:UILongPressGestureRecognizer) {
            print("longpress")
        }
        @objc func dododo() {
            print("long")
        }
    }
    
    
}




struct RepresentView_Previews: PreviewProvider {
    static var previews: some View {
        RepresentView()
            .environmentObject(Model())
    }
}
