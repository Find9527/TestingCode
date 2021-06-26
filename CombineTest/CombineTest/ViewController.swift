//
//  ViewController.swift
//  CombineTest
//
//  Created by Orange on 2021/6/25.
//

import UIKit

class ViewController: UIViewController {
    
    let scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        
        let contentview = UIView()
        contentview.backgroundColor = .red
        contentview.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(contentview)
        
        let hostVC = HostingController()
        hostVC.view.backgroundColor = .green
        hostVC.view.translatesAutoresizingMaskIntoConstraints = false
        contentview.addSubview(hostVC.view)
        
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hostVC.view.topAnchor.constraint(equalTo: contentview.topAnchor),
            hostVC.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostVC.view.rightAnchor.constraint(equalTo: contentview.rightAnchor),
            hostVC.view.bottomAnchor.constraint(equalTo: contentview.bottomAnchor)
        ])

        
    }
}
