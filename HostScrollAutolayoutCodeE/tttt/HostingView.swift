//
//  HostingView.swift
//  CombineTest
//
//  Created by Orange on 2021/6/25.
//

import UIKit
import SwiftUI


class HostingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let hostingController = UIHostingController(rootView: ForeachView())
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
//            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
        NSLayoutConstraint.activate([
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.heightAnchor.constraint(equalTo: view.heightAnchor ,constant: -600),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
        
        
    }
}




struct HostingPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let hostController = HostingController()
        return hostController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    typealias UIViewControllerType = UIViewController
}


struct HostingPreview_Previews: PreviewProvider {
    static var previews: some View {
        HostingPreview()
    }
}
