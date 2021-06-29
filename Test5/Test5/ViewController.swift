



import UIKit

class ViewController: UIViewController {

    var flowHeightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        flowHeightConstraint = button.heightAnchor.constraint(equalToConstant: 30)
        flowHeightConstraint?.isActive = true
    }

    @objc func animateButtonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.flowHeightConstraint?.constant += 100
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    lazy var button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(animateButtonTapped), for: .touchUpInside)
        return button
    }()

}

