

import UIKit

class ViewController: UIViewController, SecondVCDelegate{
   
    @IBOutlet weak var showNameL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        let nextVC : SecondVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "nextVC") as! SecondVC
        nextVC.delegate = self
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func saveName(_ nameStr: String) {
        self.showNameL.text = "你的名字是：\(nameStr)"
        print("---------------------\(nameStr)")
    }
    
    
}

