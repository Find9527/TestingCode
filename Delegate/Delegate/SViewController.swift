

import UIKit


protocol SecondCVDelegate:AnyObject {
    func resetDataInFartherVC()
}

class SecondViewController: UIViewController, SecondCVDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        label.text = "Second"
        
        
        view.addSubview(label)

    }
    
    func resetDataInFartherVC() {
        print("I am a delegae")
    }
    

}
