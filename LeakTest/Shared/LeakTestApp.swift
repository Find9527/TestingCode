//
//  LeakTestApp.swift
//  Shared
//
//  Created by Orange on 2021/6/13.
//

import SwiftUI

@main
struct LeakTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 600, height: 500, alignment: .center)
        }
    }
}
