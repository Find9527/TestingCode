//
//  ContentView.swift
//  Shared
//
//  Created by Orange on 2021/6/11.
//

import SwiftUI

struct ContentView: View {
    @State var tabCount:Int = 1
    @State var current:CGFloat = 1
    @State var final:CGFloat = 1
    
    var body: some View {
        let magni = MagnificationGesture()
            .onChanged(){ value in
                current = value

            }
            .onEnded { value in
                if current > 2 {
                    self.tabCount += 1
                }
                final = current + final
                current = 0
            }
        
        VStack {
            VStack {
                Button("ChangeView"){
                    self.tabCount += 1
                }
                if tabCount%2 == 0 {
                    Text("Static View")
                }else {
                    Scroll(current: $current)
                }
            }
            Spacer()
            HStack {
                Color.blue
            }
            .frame(width: 600, height: 100, alignment: .bottomLeading)
        }
        .frame(width: 600, height: 400)
        .gesture(magni)

    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
