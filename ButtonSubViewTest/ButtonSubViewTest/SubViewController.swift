

import UIKit

class SubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        button.setTitle("按钮", for: .normal)
        button.addTarget(self, action: #selector(buttonFun), for: .touchDown)
        button.backgroundColor = .gray
        
        let button2 = UIButton(frame: CGRect(x: 100, y: 600, width: 100, height: 40))
        button2.setTitle("按钮", for: .normal)
        button2.addTarget(self, action: #selector(buttonFun), for: .touchDown)
        button2.backgroundColor = .gray
        
        
        view.addSubview(button)
        view.addSubview(button2)
        
        let imageview = UIImageView(frame: CGRect(x: 200, y: 400, width: 300, height: 300))
        let image = UIImage(named: "image5")
        imageview.image = image
        imageview.isUserInteractionEnabled = true

        
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        
        view.addSubview(imageview)
        
        button.addGestureRecognizer(lpgr)
        button2.addGestureRecognizer(lpgr)
        imageview.addGestureRecognizer(lpgr)

        
        


    }
    
    @objc func buttonFun() {
        print("打印")
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

   

}
