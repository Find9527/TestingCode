//
//  ButtonController.swift
//  ToUIscrollView
//
//  Created by Orange on 2021/6/23.
//

import UIKit

class ButtonController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("点击", for: .normal)
        button.addTarget(self, action: #selector(tub), for: .touchDown)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func tub() {
        print("按下")
    }
}
