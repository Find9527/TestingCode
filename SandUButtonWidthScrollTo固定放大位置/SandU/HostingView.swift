


import UIKit
import SwiftUI

protocol TestProtocl:AnyObject {
    func dosomething(width:CGFloat)
}


class HostingController: UIViewController, TestProtocl {
    
    let model = ModelData()
    var widthConstraint:NSLayoutConstraint?
        
    let label = UILabel(frame: CGRect(x: 500, y: 700, width: 100, height: 100))
            
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .yellow
        
        let hostingController = UIHostingController(rootView: ForeachView().environmentObject(model))
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPressFun))
        lpgr.minimumPressDuration = 0.5
        
        let imageview = UIImageView(image: UIImage(named: "image5"))
        imageview.isUserInteractionEnabled = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.addGestureRecognizer(lpgr)

        let button = UIButton()
        button.addTarget(self, action: #selector(buttonFun), for: .touchDown)
        button.backgroundColor = .black
        button.setTitle("子view按钮自动定位", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "100"
        label.backgroundColor = .gray
        
        
        view.addSubview(button)
        view.addSubview(label)
        
        widthConstraint =             hostingController.view.widthAnchor.constraint(equalToConstant: 88*100)

        NSLayoutConstraint.activate([
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            widthConstraint!,
        ])
        
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: hostingController.view.topAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
          
    }
    
    @objc func longPressFun() {
        print("pressed")
    }
    
    @objc func buttonFun() {
        print("child view button down")
        
    }
    
    func dosomething(width:CGFloat) {
        model.width = width
        self.widthConstraint?.constant = 88 * model.width
        print("代理方法被执行","model.width",model.width)
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
            ScrollView(.horizontal) {
                HostingPreview()
                    .frame(width: 20*100, height: 900, alignment: .center)
            }
    }
}
