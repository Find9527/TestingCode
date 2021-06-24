//
//  SwiftUIView.swift
//  ToUIscrollView
//
//  Created by Orange on 2021/6/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
        }
        .frame(height:100)
        .border(Color.black,width: 2)
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
