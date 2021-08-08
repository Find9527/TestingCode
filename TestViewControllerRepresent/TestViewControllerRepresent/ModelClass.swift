//
//  Class.swift
//  TestObservedObject
//
//  Created by Orange on 2021/7/21.
//

import SwiftUI



class Model: ObservableObject {
    @Published var name:String = ""
    @Published var count:Int = 0
    {
        didSet {
            print(oldValue, "oldvalue")
        }
    }
}

