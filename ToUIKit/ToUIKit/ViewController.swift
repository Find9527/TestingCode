//
//  ViewController.swift
//  ToUIKit
//
//  Created by Orange on 2021/6/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uihost = UIHostingController(rootView: ContentView())
        uihost.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(uihost.view)
        
        let topCon = uihost.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 400)
        let leaCon = uihost.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let traCon = uihost.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        
        
        topCon.isActive = true
        leaCon.isActive = true
        traCon.isActive = true
        
    }


}

