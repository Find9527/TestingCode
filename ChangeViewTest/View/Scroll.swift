//
//  Scroll.swift
//  ChangeViewTest
//
//  Created by Orange on 2021/6/16.
//

import SwiftUI

struct Scroll:View {
    @Binding var current:CGFloat
    
    let intRandom = Int.random(in: 1..<18)

    var body: some View {
        ScrollViewReader { proxy in
            HStack {
                
                Button("Foreword"){
                    proxy.scrollTo(9, anchor: .center)
                }
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<20) { item in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 100, height: 40)
                            .overlay(Text("\(item)").foregroundColor(.white))
                            .id(item)
                    }
                }
                .onChange(of: current, perform: { value in
                    proxy.scrollTo(Int.random(in: 1..<18), anchor: .center)
                })
            }
        }
    }
}

struct Scroll_Previews: PreviewProvider {
    @State static var tabCount:CGFloat = 0
    static var previews: some View {
        Scroll(current: $tabCount)
    }
}
