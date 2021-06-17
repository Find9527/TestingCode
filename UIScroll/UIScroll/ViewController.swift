//
//  ViewController.swift
//  UIScroll
//
//  Created by Orange on 2021/6/15.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var scroll: UIScrollView!
    var imageview:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageview = UIImageView(image: UIImage(named: "image3"))
        scroll = UIScrollView(frame: view.bounds)
        scroll.backgroundColor = UIColor.gray
        scroll.contentSize = imageview.bounds.size
        scroll.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        scroll.setContentOffset(CGPoint(x: 200, y: 200), animated: true)
        
        scroll.addSubview(imageview)
        self.view.addSubview(scroll)
        
        scroll.delegate = self
        scroll.minimumZoomScale = 0.1
        scroll.maximumZoomScale = 4.0
        scroll.zoomScale = 1.0
                
            
    }
    

}
    
