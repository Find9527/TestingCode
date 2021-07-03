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
            ForEach(0..<18) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
            LazyHStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(Text("\(20)").foregroundColor(.white))
                    .foregroundColor(.blue)
                    .onAppear(){
                        print("appear")
                    }
                    .onDisappear(){
                        print("disdis")
                    }
            }
        }
        .frame(height: 200)
        .border(Color.black)

    }
}

struct ForeachView_Previews: PreviewProvider {
    static var previews: some View {
        ForeachView()
    }
}
