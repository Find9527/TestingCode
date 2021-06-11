//
//  CustomPageViewController.swift
//  MUma
//
//  Created by Orange on 2021/6/10.
//

import Foundation
import UIKit

class CustomPageViewController: UIPageViewController {
  var individualPageViewControllerList = [UIViewController]()
  override func viewDidLoad() {
    super.viewDidLoad()

    individualPageViewControllerList = [
      DemoIndividualPageViewController.getInstance(index: 0),
      DemoIndividualPageViewController.getInstance(index: 1),
      DemoIndividualPageViewController.getInstance(index: 2),
      DemoIndividualPageViewController.getInstance(index: 3),
    ]

    setViewControllers([individualPageViewControllerList[0]], direction: .forward, animated: true, completion: nil)
  }
}



extension CustomPageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of: viewController)!
    if indexOfCurrentPageViewController == 0 {
     return nil // To show there is no previous page
    } else {
      // Previous UIViewController instance
      return individualPageViewControllerList[indexOfCurrentPageViewController - 1]
    }
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of: viewController)!
    if indexOfCurrentPageViewController == individualPageViewControllerList.count - 1 {
      return nil // To show there is no next page
    } else {
      // Next UIViewController instance
      return individualPageViewControllerList[indexOfCurrentPageViewController + 1]
    }
  }
}
