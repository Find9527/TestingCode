//
//  SwiftUIView.swift
//  LazyInUIKitTest
//
//  Created by Orange on 2021/7/3.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<19) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100,height: 40)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
            LazyHStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100,height: 40)
                    .foregroundColor(.blue)
                    .onAppear(){
                        print("appear")
                    }
                    .onDisappear() {
                        print("disdis")
                    }
            }
        }
//        .frame(width:20*100)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
