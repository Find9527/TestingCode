

import UIKit
import SwiftUI

class ScrollController:UIViewController {
    
    var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .red
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()

    var contentView: UIView = {
      let contentView = UIView()
        contentView.backgroundColor = .gray
      contentView.translatesAutoresizingMaskIntoConstraints = false
      return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
                
        let uihost = UIHostingController(rootView: SwiftUIView())
        uihost.view.translatesAutoresizingMaskIntoConstraints = false

        
        let cenCon = uihost.view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        let leaCon = uihost.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let traCon = uihost.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let heiCon = uihost.view.heightAnchor.constraint(equalTo: contentView.widthAnchor, constant: -100)
        
        
    
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(uihost.view)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        
        leaCon.isActive = true
        cenCon.isActive = true
        traCon.isActive = true
        heiCon.isActive = true
                
    }
    
    
}
