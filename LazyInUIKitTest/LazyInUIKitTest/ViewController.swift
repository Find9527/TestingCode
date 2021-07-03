//
//  ViewController.swift
//  LazyInUIKitTest
//
//  Created by Orange on 2021/7/3.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    @IBSegueAction func host(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }


}

