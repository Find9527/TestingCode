//
//  Item.swift
//  Homepwner
//
//  Created by Orange on 2021/6/28.
//

import UIKit
import Foundation

class Item: NSObject {
    var name:String
    var valueInDollars:Int
    var serialNumber:String?
    let dateCreated:NSData
    
    init(name:String, serialNumber:String?, valueInDollars:Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSData()
        
        super.init()
    }
    convenience init(random: Bool = false) {
        if random {
            self.init(name:"name",serialNumber:"serialnumber",valueInDollars:0)
        }
        else {
            self.init(name:"name",serialNumber:"serialnumber",valueInDollars:0)
        }
    }
    
}


