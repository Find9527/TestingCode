//
//  SwiftUIView.swift
//  Hosting_UIScrollView
//
//  Created by Orange on 2021/6/14.
//

import SwiftUI
import UIKit

struct SwiftUIView: View {
    var body: some View {
        VStack {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:40,height: 100)
                
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

