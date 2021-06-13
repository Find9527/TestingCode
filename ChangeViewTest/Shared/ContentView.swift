//
//  ContentView.swift
//  Shared
//
//  Created by Orange on 2021/6/11.
//

import SwiftUI

struct ContentView: View {
    @State var tabCount:Int = 1
    var body: some View {
        let magni = MagnificationGesture()
            .onChanged(){ value in

            }
            .onEnded { value in
                self.tabCount += 1
            }
        
        VStack {
            VStack {
                Button("ChangeView"){
                    self.tabCount += 1
                }
                if tabCount%2 == 0 {
                    Text("Static View")
                }else {
                    scrollView(tabCount: $tabCount)
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

struct scrollView:View {
    @Binding var tabCount:Int
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
                            .onAppear() {
                                proxy.scrollTo(tabCount, anchor: .center)
                            }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
