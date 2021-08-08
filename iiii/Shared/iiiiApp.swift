//
//  iiiiApp.swift
//  Shared
//
//  Created by Orange on 2021/5/5.
//

import SwiftUI

@main
struct iiiiApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            MainPageView()
                .environmentObject(ModelData())
                .environmentObject(ModelIndex())
                .frame(minWidth: 900, idealWidth: 960, maxWidth: 2000, minHeight: 600, idealHeight: 650, maxHeight: 700, alignment: .center)
            #else
            SwiftUIView5()
            #endif
        }
    }
}
