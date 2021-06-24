//
//  ViewController.swift
//  Project6b
//
//  Created by Orange on 2021/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onecontroller = OneController()
        view.addSubview(onecontroller.view)
        onecontroller.view.frame = CGRect(x: 10, y: 100, width: 200, height: 20)
        
        
        

        

    }
}

