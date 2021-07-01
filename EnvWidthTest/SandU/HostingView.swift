


import UIKit
import SwiftUI



class HostingController: UIViewController, AppearDeligate {
    
    var foreachview = ForeachView()
    
    let model = ModelData()
    var widthConstraint:NSLayoutConstraint?
    var hahaha:CGFloat = 100
    
    private var iszoom:Bool = true
    private var observevalue:CGFloat = 0 {
        didSet {
            if oldValue<observevalue {
                self.iszoom = true
            }else {
                self.iszoom = false
            }
        }
    }
    private var currenrt:CGFloat = 1
    private var final:CGFloat = 2
   
    
    var delegate: ViewController?
    

    let label = UILabel(frame: CGRect(x: 500, y: 700, width: 100, height: 100))
            
    override func viewDidLoad() {
        super.viewDidLoad()
                
        foreachview.foreachdelegate = self
        view.backgroundColor = .yellow
        
        let hostingController = UIHostingController(rootView:foreachview.environmentObject(model))
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
        
        widthConstraint = hostingController.view.widthAnchor.constraint(equalToConstant: 20*100)

        NSLayoutConstraint.activate([
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //hostingController.view.widthAnchor.constraint(equalToConstant: 20*100),
            widthConstraint!
        ])
        
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: hostingController.view.topAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureFun))
        view.addGestureRecognizer(pinchGesture)
          
    }
    
    @objc func longPressFun() {
        print("pressed")
    }
    
    @objc func buttonFun() {
        delegate!.dosomething(width: self.hahaha)
        model.count += 1
        print(self.final)
    }
    
    @objc func pinchGestureFun(_ recognizer:UIPinchGestureRecognizer) {
        self.hahaha = 100*setzoom(recognizer) + 50
        delegate?.dosomething(width: hahaha)
        widthConstraint!.constant = hahaha * 20
        model.width = hahaha
    }
    
    func setzoom(_ recognizer:UIPinchGestureRecognizer) -> CGFloat {
        self.currenrt = recognizer.scale - 1
        self.final = currenrt*0.1+final
        self.observevalue = currenrt + observevalue
        if final >= 4 {
            final = 4
            if iszoom == true {
                model.count += 1
            }
        }
        else if final <= 0.5 {
            final = 0.5
            if iszoom == false {
                model.count -= 1
            }
        }
        
        if model.count >= 3 {
            model.count = 3
        }
        else if model.count <= 1 {
            model.count = 1
        }
        self.currenrt = 1
        print(model.count,"当前视图",final,"final",iszoom)
        return self.final
    }
    
    
      
    func isDidAppear() {
        print("isappear")
        if iszoom == true {
            self.hahaha = 100
            self.final = 0.5
            delegate?.dosomething(width: hahaha)
            widthConstraint?.constant = 20*100
            model.width = hahaha
        }else if iszoom == false {
            self.hahaha = 400
            self.final = 4
            delegate?.dosomething(width: hahaha)
            widthConstraint?.constant = 20*400
            model.width = hahaha
        }
        
    }
}



protocol TestProtocl:AnyObject {
    func dosomething(width:CGFloat)
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
