

import UIKit
import SwiftUI



class ViewController: UIViewController, TestProtocl {
    
    var width:CGFloat = 100
    var widthConstrain:NSLayoutConstraint?
   
    let scroll = UIScrollView()
    let hostVC = HostingController()
    
    private var currenrt:CGFloat = 1
    private var final:CGFloat = 0
    private var maxZoom:CGFloat = 4
    private var minZoom:CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        addChild(hostVC)

        hostVC.delegate = self

        scroll.backgroundColor = .red
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        let contentview = UIView()
        contentview.backgroundColor = .green
        contentview.translatesAutoresizingMaskIntoConstraints = false
        
        hostVC.view.backgroundColor = .gray
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
        print("father button")
    }
    
    func dosomething(width: CGFloat) {
        self.width = width
        widthConstrain?.constant = width * 20
        scroll.setContentOffset(CGPoint(x: 9.6*width-333, y: 0), animated: false)
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

