

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scroll = UIScrollView()
        let hostVC = HostingController()
        
        

        scroll.backgroundColor = .gray
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        let contentview = UIView()
        contentview.backgroundColor = .green
        contentview.translatesAutoresizingMaskIntoConstraints = false
        
        hostVC.view.backgroundColor = .blue
        hostVC.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostVC)
        
        view.addSubview(scroll)
        scroll.addSubview(contentview)
        contentview.addSubview(hostVC.view)
//        contentview.addSubview(imageview)
        
       
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            imageview.topAnchor.constraint(equalTo: contentview.topAnchor),
//            imageview.leftAnchor.constraint(equalTo: contentview.leftAnchor),
//            imageview.rightAnchor.constraint(equalTo: contentview.rightAnchor),
//            imageview.bottomAnchor.constraint(equalTo: contentview.bottomAnchor)
//        ])
        
        
        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            contentview.widthAnchor.constraint(equalToConstant: 1200),
            contentview.heightAnchor.constraint(equalToConstant: 800)
        ])
        
        NSLayoutConstraint.activate([
            hostVC.view.centerXAnchor.constraint(equalTo: contentview.centerXAnchor),
            hostVC.view.centerYAnchor.constraint(equalTo: contentview.centerYAnchor),
            hostVC.view.widthAnchor.constraint(equalToConstant: 600),
            hostVC.view.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        
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

