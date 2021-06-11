//
//  DemoIndividualPageViewController.swift
//  MUma
//
//  Created by Orange on 2021/6/10.
//

import Foundation
import UIKit

class DemoIndividualPageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var index = 0

      static func getInstance(index: Int) -> DemoIndividualPageViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DemoIndividualPageViewController") as! DemoIndividualPageViewController
        vc.index = index
        return vc
      }

      override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "(Page \(index))"
        view.backgroundColor = index % 2 == 0 ? .systemBlue : .systemGreen
      }
}



