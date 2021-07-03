

import SwiftUI
import UIKit

class HostingController: UIViewController {
    
    let host = UIHostingController(rootView: SwiftUIView())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let hosting = UIHostingController(rootView: SwiftUIView())
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hosting.view)
        

        NSLayoutConstraint.activate([
            hosting.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hosting.view.heightAnchor.constraint(equalTo: view.heightAnchor ,constant: -600),
            hosting.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hosting.view.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
    



}
