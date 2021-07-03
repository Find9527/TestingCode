//
//  SwiftUIView.swift
//  LazyInUIKitTest
//
//  Created by Orange on 2021/7/3.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack {
            ForEach(0..<20) { _ in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width:100,height: 40)
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
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
