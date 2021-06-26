

import UIKit

class ViewController: UIViewController {
    let scrollview = UIScrollView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview.backgroundColor = .red
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        let scrolltop = scrollview.topAnchor.constraint(equalTo: view.topAnchor)
        let scrolllea = scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let scrolltra = scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let scrollbot = scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        view.addSubview(scrollview)

        
        let contentview = UIView()
        contentview.backgroundColor = .gray
        contentview.translatesAutoresizingMaskIntoConstraints = false
        let contenttop = contentview.topAnchor.constraint(equalTo: scrollview.topAnchor)
        let contentlea = contentview.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor)
        let contenttra = contentview.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor)
        let contentbot = contentview.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor)
        
        
        scrollview.addSubview(contentview)
        
        
        let imageview = UIImageView(image: UIImage(named: "image1"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        let imageviewtop = imageview.topAnchor.constraint(equalTo: contentview.topAnchor)
        let imageviewlea = imageview.leadingAnchor.constraint(equalTo: contentview.leadingAnchor)
        let imageviewtra = imageview.trailingAnchor.constraint(equalTo: contentview.trailingAnchor)
        let imageviewbot = imageview.bottomAnchor.constraint(equalTo: contentview.bottomAnchor)


        contentview.addSubview(imageview)
        
        
     
        
        scrolltop.isActive = true
        scrolllea.isActive = true
        scrolltra.isActive = true
        scrollbot.isActive = true

        contenttop.isActive = true
        contentlea.isActive = true
        contenttra.isActive = true
        contentbot.isActive = true

        
        imageviewtop.isActive = true
        imageviewlea.isActive = true
        imageviewtra.isActive = true
        imageviewbot.isActive = true
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollview.setContentOffset(CGPoint(x: 300, y: 300), animated: false)
    }


}

