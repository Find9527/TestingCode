//
//  ViewController.swift
//  ScrollPageView
//
//  Created by Orange on 2021/6/9.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let scrollView = UIScrollView(frame: CGRect(x:0, y:100, width:320,height: 300))
    var colors:[UIColor] = [UIColor.red, UIColor.gray, UIColor.blue]
    var frame:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    let pageControl = UIPageControl(frame: CGRect(x:50,y: 400, width:200, height:50))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //添加scrollview
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.gray
        self.view.addSubview(scrollView)
        for index in 0..<3 {

            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size

            let subView = UIView(frame: frame)
            subView.backgroundColor = colors[index]
            self.scrollView .addSubview(subView)
        }
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.size.width * 4,height: self.scrollView.frame.size.height)
        
        //添加pagecontrol
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        
        //用pagecontrol控制scrollview滚动
        pageControl.addTarget(self, action: #selector(self.changePage(papra:)), for: UIControl.Event.valueChanged)
        
                
    }
    @objc func changePage(papra: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }

}

