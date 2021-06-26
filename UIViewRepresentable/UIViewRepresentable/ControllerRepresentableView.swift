//
//  ControllerRepresentableView.swift
//  UIViewRepresentable
//
//  Created by Orange on 2021/6/25.
//

import SwiftUI

struct ControllerRepresentableView: View {
    var body: some View {
        MyControllerView()
    }
}


struct MyControllerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let myCV = ViewController()
        
        
        return myCV
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}

struct ControllerRepresentableView_Previews: PreviewProvider {
    static var previews: some View {
        ControllerRepresentableView()
    }
}
