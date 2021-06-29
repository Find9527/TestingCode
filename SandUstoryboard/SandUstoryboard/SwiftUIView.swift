//
//  SwiftUIView.swift
//  SandUstoryboard
//
//  Created by Orange on 2021/6/27.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100, height: 40)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
