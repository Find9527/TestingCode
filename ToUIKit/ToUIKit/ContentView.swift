//
//  ContentView.swift
//  ToUIKit
//
//  Created by Orange on 2021/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        HStack {
//            Image("image3")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 380)
//        }
//        .frame(width: 390, height: 400)
//        .border(Color.black, width: 3)
        VStack {
            ForEach(0..<100) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 40, height: 100, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
        }
        .frame(width:100)
        .border(Color.black,width: 2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
