//
//  SecondViewController.swift
//  SandUstoryboard
//
//  Created by Orange on 2021/6/27.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageview!.isUserInteractionEnabled = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressFun))
        longPress.minimumPressDuration = 0.5
        
        imageview.addGestureRecognizer(longPress)
        

    }
    
    @objc func longPressFun() {
        print("dauing")
    }

}
