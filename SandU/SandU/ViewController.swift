

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let scroll = UIScrollView()
    
//    var width:CGFloat {
//        return width
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .gray
        view.addSubview(scroll)
        
        let contentview = UIView()
        //contentview.backgroundColor = .green
        contentview.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(contentview)
        
        let hostVC = HostingController()
        //hostVC.view.backgroundColor = .blue
        hostVC.view.translatesAutoresizingMaskIntoConstraints = false
        contentview.addSubview(hostVC.view)
        
        
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            hostVC.view.topAnchor.constraint(equalTo: contentview.topAnchor),
            hostVC.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostVC.view.rightAnchor.constraint(equalTo: contentview.rightAnchor),
            hostVC.view.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
        ])
        
        
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchFun))
        scroll.addGestureRecognizer(pinGesture)
          
    }
    
    @objc func pinchFun(_ recognizer: UIPinchGestureRecognizer) {
        print("pinch",recognizer.scale)
    }
}






struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let hostController = ViewController()
        return hostController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    typealias UIViewControllerType = UIViewController
}


struct ViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
    }
}

