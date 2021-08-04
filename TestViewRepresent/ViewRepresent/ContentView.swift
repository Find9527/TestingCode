//
//  ContentView.swift
//  ajfaslfl
//
//  Created by Orange on 2021/7/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Model()
    
    var body: some View {
        VStack {
            ToSwiftUI()
                .environmentObject(model)
                .frame(height:600)
            Text("\(model.name)")
                .frame(width: 200, height: 100, alignment: .center)
                .border(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
