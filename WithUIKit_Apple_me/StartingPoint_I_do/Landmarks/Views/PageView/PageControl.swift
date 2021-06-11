//
//  PageControl.swift
//  Landmarks
//
//  Created by Orange on 2021/6/11.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI
import UIKit


struct PageControl:UIViewRepresentable {
    
    var numberOfPages:Int
    @Binding var currentPage:Int
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
}



struct PageControl_Previews: PreviewProvider {
    @State static var currentPage: Int = 0
    static var previews: some View {
        PageControl(numberOfPages: 3, currentPage: $currentPage)
            .frame(width:3*18)
            .background(Color.blue)
    }
}
