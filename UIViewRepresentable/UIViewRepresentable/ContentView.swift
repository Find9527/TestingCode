//
//  ContentView.swift
//  UIViewRepresentable
//
//  Created by Orange on 2021/6/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        MagratView()
    }
}



struct MagratView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIScrollView {
        let scroll = UIScrollView()
        scroll.backgroundColor = .gray
        
        let contentview = UIView()
        contentview.backgroundColor = .red

        contentview.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(contentview)
        
        let imageview = UIImageView(image: UIImage(named: "image3"))
        imageview.translatesAutoresizingMaskIntoConstraints = false

        contentview.addSubview(imageview)
        
        
        NSLayoutConstraint.activate([
            contentview.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentview.rightAnchor.constraint(equalTo: scroll.rightAnchor),
            contentview.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            contentview.leftAnchor.constraint(equalTo: scroll.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: contentview.topAnchor),
            imageview.rightAnchor.constraint(equalTo: contentview.rightAnchor),
            imageview.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
            imageview.leftAnchor.constraint(equalTo: contentview.leftAnchor)
          ])

        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.setContentOffset(CGPoint(x: 100, y: 300), animated: true)

    }
    
    typealias UIViewType = UIScrollView
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
