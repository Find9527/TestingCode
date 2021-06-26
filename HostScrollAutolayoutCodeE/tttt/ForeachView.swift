//
//  ForeachView.swift
//  CombineTest
//
//  Created by Orange on 2021/6/25.
//

import SwiftUI

struct ForeachView: View {
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
        }
        .frame(height: 200)
        .border(Color.black)
//        Image("image3")
    }
}

struct ForeachView_Previews: PreviewProvider {
    static var previews: some View {
        ForeachView()
    }
}
