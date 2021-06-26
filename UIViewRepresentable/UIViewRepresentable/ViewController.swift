//
//  ViewController.swift
//  test
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
        
        let imageview = UIImageView(image: UIImage(named: "image3"))
        imageview.translatesAutoresizingMaskIntoConstraints = false

        contentview.addSubview(imageview)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: contentview.topAnchor),
            imageview.rightAnchor.constraint(equalTo: contentview.rightAnchor),
            imageview.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
            imageview.leftAnchor.constraint(equalTo: contentview.leftAnchor)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scroll.setContentOffset(CGPoint(x: 1000, y: 100), animated: false)
    }
}
