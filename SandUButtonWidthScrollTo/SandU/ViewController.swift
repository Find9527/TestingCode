

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var widthConstrain:NSLayoutConstraint?
   
    let scroll = UIScrollView()
    let hostVC = HostingController()
    private var delegate: TestProtocl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
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
            scroll.widthAnchor.constraint(equalTo: view.widthAnchor),
            scroll.heightAnchor.constraint(equalTo: view.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            contentview.heightAnchor.constraint(equalTo: scroll.heightAnchor)
        ])
        
        widthConstrain = hostVC.view.widthAnchor.constraint(equalToConstant: 20*100)
        NSLayoutConstraint.activate([
            hostVC.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostVC.view.widthAnchor.constraint(equalTo: contentview.widthAnchor),
            hostVC.view.heightAnchor.constraint(equalTo: contentview.heightAnchor),
            hostVC.view.centerYAnchor.constraint(equalTo: contentview.centerYAnchor),
            //hostVC.view.widthAnchor.constraint(equalToConstant: 20*100),
            widthConstrain!
        ])
        
    }
    
    @objc func buttonFun() {
        delegate?.dosomething()
        widthConstrain?.constant = hostVC.width! * 20
        scroll.setContentOffset(CGPoint(x: 13*hostVC.width!, y: 0), animated: false)
        print("width",hostVC.width!,widthConstrain!.constant)
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

