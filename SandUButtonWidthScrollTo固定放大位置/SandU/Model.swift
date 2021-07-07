//
//  Model.swift
//  SandU
//
//  Created by Orange on 2021/6/29.
//

import UIKit



class ModelData: ObservableObject {
    @Published var width:CGFloat = 100
    @Published var scrollvalue:CGFloat = 0
    @Published var mainwidth:CGFloat = 0
}
