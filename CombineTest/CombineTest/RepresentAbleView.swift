//
//  RepresentAbleView.swift
//  CombineTest
//
//  Created by Orange on 2021/6/25.
//

import SwiftUI
import UIKit


struct RepresentAbleView:UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewcontroller = ViewController()
        viewcontroller.view.backgroundColor = .gray
        
        return viewcontroller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    typealias UIViewControllerType = UIViewController
}




struct RepresentAbleView_Preview: PreviewProvider {
    static var previews: some View {
        RepresentAbleView()
    }
}
