//
//  ViewController.swift
//  SandUstoryboard
//
//  Created by Orange on 2021/6/27.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBSegueAction func hostingfun(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    
}

