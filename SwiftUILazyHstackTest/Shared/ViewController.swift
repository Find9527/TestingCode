

import UIKit
import SwiftUI

class ViewController: UIViewController, UIScrollViewDelegate {

    
    let frame = CGRect(x: 100, y: 100, width: 100, height: 100)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let scroll = UIScrollView()
        scroll.delegate = self
        let label = UILabel(frame: CGRect(x: 100, y: 300, width: 100, height: 100))

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
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            //contentview.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            //contentview.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),

        ])
        
        NSLayoutConstraint.activate([
            hostVC.view.topAnchor.constraint(equalTo: contentview.topAnchor),
            hostVC.view.leftAnchor.constraint(equalTo: contentview.leftAnchor),
            hostVC.view.rightAnchor.constraint(equalTo: contentview.rightAnchor),
            hostVC.view.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
        ])
        

        let button = UIButton()
        button.frame = frame
        button.addTarget(self, action:#selector(buttonFun(scroll:)), for: .touchDown)
        button.backgroundColor = .gray
        button.setTitle("按钮", for: .normal)
        
        
        
        
        view.addSubview(button)
        view.addSubview(label)
        
        
    }
    
    
    @objc func buttonFun(scroll: UIScrollView) {
        print("anxia", scroll.contentOffset.x)  //会崩溃
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("did",scrollView.contentOffset.x)
    }
    
}

