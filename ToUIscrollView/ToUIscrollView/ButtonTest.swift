//
//  ButtonTest.swift
//  ToUIscrollView
//
//  Created by Orange on 2021/6/23.
//

import UIKit


class BController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("按下", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(change(_:)), for: .touchDown)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func change(_ button:UIButton) {
        print("按下")
        button.setTitle("is tapped", for: .normal)
    }
}
