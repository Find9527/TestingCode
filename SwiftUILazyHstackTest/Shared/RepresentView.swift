//
//  RepresentView.swift
//  swiftuiLazyTest
//
//  Created by Orange on 2021/7/3.
//

import SwiftUI

struct RepresentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let VC = ViewController()
        return VC
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}

struct RepresentView_Previews: PreviewProvider {
    static var previews: some View {
        RepresentView()
    }
}
