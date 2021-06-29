



import UIKit
import SwiftUI


class HostingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame = CGRect(x: 0, y: 0, width: 500, height: 600)
        view.backgroundColor = .yellow
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPressFun))
        lpgr.minimumPressDuration = 0.5
        
        let imageview = UIImageView(image: UIImage(named: "image3"))
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(lpgr)
        imageview.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonFun), for: .touchDown)
        button.backgroundColor = .red
        button.setTitle("anniu", for: .normal)
        
        view.addGestureRecognizer(lpgr)
        
        
        view.addSubview(imageview)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: view.topAnchor),
            imageview.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageview.widthAnchor.constraint(equalToConstant: 500),
            imageview.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10)
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
