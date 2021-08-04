//
//  SwiftUIView.swift
//  TestObservedObject
//
//  Created by Orange on 2021/7/21.
//

import SwiftUI

struct SwiftUIView: View {
    @EnvironmentObject var model: Model
    var body: some View {
//        HStack {
//            ForEach(0..<100) { item in
//                RoundedRectangle(cornerRadius: 25.0)
//                    .frame(width:100,height: 40)
//            }
//        }
        Text("\(model.name) is swiftUI")
            .frame(width: 200, height: 100, alignment: .leading)
            .border(Color.black)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .environmentObject(Model())
    }
}
