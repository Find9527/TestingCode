



import UIKit
import SwiftUI

protocol TestProtocl:AnyObject {
    func dosomething()
}


class HostingController: UIViewController, TestProtocl {
    
    func dosomething() {
        print("代理方法被执行")
    }
        
    let label = UILabel(frame: CGRect(x: 500, y: 700, width: 100, height: 100))
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        //let hostingController = UIHostingController(rootView: ForeachView())
        //hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(hostingController.view)
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPressFun))
        lpgr.minimumPressDuration = 0.5
        
        let imageview = UIImageView(image: UIImage(named: "image5"))
        imageview.isUserInteractionEnabled = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.addGestureRecognizer(lpgr)

        let button = UIButton()
        button.addTarget(self, action: #selector(buttonFun), for: .touchDown)
        button.backgroundColor = .black
        button.setTitle("执行代理", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = String(100)
        label.backgroundColor = .gray
        
        
        
        view.addSubview(imageview)
        view.addSubview(button)
        view.addSubview(label)
        
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: view.topAnchor),
            imageview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageview.widthAnchor.constraint(equalToConstant: 400),
            imageview.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    
          
    }
    
    @objc func longPressFun() {
        print("pressed")
    }
    
    @objc func buttonFun() {
        print("button down")
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
