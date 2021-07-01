//
//  TwoView.swift
//  EnvWidthTest
//
//  Created by Orange on 2021/6/30.
//

import SwiftUI

struct TwoView: View {
    @EnvironmentObject var model:ModelData

    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: model.width, height: 40, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
                    .foregroundColor(.yellow)
            }
        }
        .frame(height: 200)
        .border(Color.black)
    }
}

struct TwoView_Previews: PreviewProvider {
    static var previews: some View {
        TwoView()
            .environmentObject(ModelData())
    }
}
