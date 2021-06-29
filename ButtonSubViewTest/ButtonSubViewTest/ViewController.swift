//
//  ViewController.swift
//  ButtonSubViewTest
//
//  Created by Orange on 2021/6/27.
//

import UIKit

class ViewController: UIViewController {

    let subVC = SubViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(subVC)
        view.addSubview(subVC.view)
        
    }


}

