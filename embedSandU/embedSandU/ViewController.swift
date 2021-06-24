//
//  ViewController.swift
//  embedSandU
//
//  Created by Orange on 2021/6/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    let model = ModelData()
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonfun), for: .touchDown)
    }
    
    
    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView().environmentObject(model))
    }
    
    @objc func buttonfun() {
        self.model.width += 40
        print("打印",model.width)
    }
    

}

