//
//  ViewController.swift
//  ToUIscrollView
//
//  Created by Orange on 2021/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollCV = ScrollController()
    let button = ButtonController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        addChild(scrollCV)
        scrollCV.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollCV.view)
        NSLayoutConstraint.activate([
            scrollCV.view.topAnchor.constraint(equalTo: view.topAnchor),
            scrollCV.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollCV.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollCV.view.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        addChild(button)
        view.addSubview(button.view)
        button.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            button.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            button.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            button.view.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -200)
        ])

    }
    
    
}

extension ScrollController {
    override func viewDidAppear(_ animated: Bool) {
        scrollView.setContentOffset(CGPoint(x: 300, y: 0), animated: false)
    }
}
