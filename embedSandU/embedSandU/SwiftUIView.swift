//
//  SwiftUIView.swift
//  embedSandU
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
        VStack {
            HStack {
                ForEach(0..<20) { item in
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width:model.width, height:40)
                        .overlay(Text("\(item)").foregroundColor(.white))
                }
            }
            Button("按钮") {
                model.width += 40
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .environmentObject(ModelData())
    }
}
