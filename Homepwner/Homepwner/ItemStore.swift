//
//  ItemStore.swift
//  Homepwner
//
//  Created by Orange on 2021/6/28.
//

import UIKit



class ItemStroe {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            creatItem()
        }
    }
    
    @discardableResult func creatItem() -> Item {
        let newItem = Item(random:true)
        
        allItems.append(newItem)
        return newItem
        
    }
}


