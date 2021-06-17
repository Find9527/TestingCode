//
//  ViewController.swift
//  ScrollAutolayout
//
//  Created by Orange on 2021/6/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageview = UIImageView(image: UIImage(named: "image3"))
        
        scroll.addSubview(imageview)
        self.view.addSubview(scroll)
        
        
    }


}

