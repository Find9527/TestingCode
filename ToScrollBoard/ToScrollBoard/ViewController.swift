





import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let model = ModelData()
    

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var containerview: UIView!
    @IBOutlet weak var trailingCon: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trailingCon.constant = 25*100
        button.addTarget(self, action: #selector(buttonfun), for: .touchDown)
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        button.addGestureRecognizer(lpgr)
        
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchFun))
        containerview.addGestureRecognizer(pinGesture)

    }

    @IBSegueAction func swiftuihosting(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView().environmentObject(model))
    }
    
    @objc func buttonfun() {
        model.width += 40
        trailingCon.constant = 25*model.width
        scroll.setContentOffset(CGPoint(x: 13*model.width, y: 0), animated: false)
    }
    
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            //When lognpress is start or running
            print("long")
        }
        else {
            //When lognpress is finish
            print("fail")
        }
    }
    
    @objc func pinchFun(gestureReconizer:UIPinchGestureRecognizer) {
        model.width += 4
        trailingCon.constant = 25*model.width
        scroll.setContentOffset(CGPoint(x: 13*model.width, y: 0), animated: false)
        print(gestureReconizer.scale)
    }
}

