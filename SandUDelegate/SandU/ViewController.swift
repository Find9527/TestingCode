

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var width:Int = 100
    let hostVC = HostingController()
    
    var delegate: TestProtocl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let scroll = UIScrollView()
        addChild(hostVC)

        self.delegate = hostVC

        scroll.backgroundColor = .red
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        let contentview = UIView()
        contentview.backgroundColor = .green
        contentview.translatesAutoresizingMaskIntoConstraints = false
        
        hostVC.view.backgroundColor = .blue
        hostVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton(frame: CGRect(x: 500, y: 600, width: 200, height: 40))
        button.backgroundColor = .black
        button.setTitle("父View的按钮", for: .normal)
        button.addTarget(self, action: #selector(buttonFun), for: .touchDown)
        
        
        view.addSubview(scroll)
        scroll.addSubview(contentview)
        contentview.addSubview(hostVC.view)
        view.addSubview(button)

        
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
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            contentview.widthAnchor.constraint(equalToConstant: 1500),
            contentview.heightAnchor.constraint(equalTo: scroll.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hostVC.view.topAnchor.constraint(equalTo: contentview.topAnchor),
            hostVC.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostVC.view.widthAnchor.constraint(equalToConstant: 500),
            hostVC.view.heightAnchor.constraint(equalToConstant: 700)
        ])
        
    }
    
    @objc func buttonFun() {
        delegate?.dosomething()
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

