//
//  ViewController.swift
//  ToScrollBoard
//
//  Created by Orange on 2021/6/24.
//

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

    }

    @IBSegueAction func swiftuihosting(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView().environmentObject(model))
    }
    
    @objc func buttonfun() {
        model.width += 40
        trailingCon.constant = 25*model.width
        scroll.setContentOffset(CGPoint(x: 13*model.width, y: 0), animated: false)
//        print("print",model.width)

    }
    
}

