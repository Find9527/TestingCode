//
//  ForeachView.swift
//  CombineTest
//
//  Created by Orange on 2021/6/25.
//

import SwiftUI

struct ForeachView: View {
    @EnvironmentObject var second:ModelData
    
    var body: some View {
        VStack {
            HStack(spacing:0) {
                ForEach(0..<20) { item in
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: second.width, height: 40, alignment: .center)
                        .overlay(Text("\(item)").foregroundColor(.white))
                }
            }
            .frame(height: 200)
            .border(Color.black)
            Button("width") {
                second.width += 40
            }
        }
    }
}










struct ForeachView_Previews: PreviewProvider {
    static var width:Int = 100
    static var previews: some View {
        ForeachView()
            .environmentObject(ModelData())
    }
}
