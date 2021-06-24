//
//  SwiftUIView.swift
//  ToScrollBoard
//
//  Created by Orange on 2021/6/24.
//

import SwiftUI


class ModelData: ObservableObject {
    @Published var width:CGFloat = 100
}


struct SwiftUIView: View {
    @EnvironmentObject var model:ModelData
    var body: some View {
        HStack {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: model.width, height: 40, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
