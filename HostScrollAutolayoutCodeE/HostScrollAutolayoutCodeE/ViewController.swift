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
        scroll.backgroundColor = .red
        view.addSubview(scroll)
        
        let contentview = UIView()
        contentview.backgroundColor = .green
        contentview.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(contentview)
        
        let hostVC = HostingController()
        hostVC.view.backgroundColor = .blue
        hostVC.view.translatesAutoresizingMaskIntoConstraints = false
        contentview.addSubview(hostVC.view)
        
        
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
//            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
//            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
//            contentview.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            contentview.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),

        ])
        
        NSLayoutConstraint.activate([
            hostVC.view.topAnchor.constraint(equalTo: contentview.topAnchor),
            hostVC.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostVC.view.rightAnchor.constraint(equalTo: contentview.rightAnchor),
            hostVC.view.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
        ])
  
        
    }
}
