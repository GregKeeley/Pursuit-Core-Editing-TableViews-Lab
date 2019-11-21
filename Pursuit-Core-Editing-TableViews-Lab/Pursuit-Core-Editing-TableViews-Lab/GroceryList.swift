//
//  GroceryList.swift
//  Pursuit-Core-Editing-TableViews-Lab
//
//  Created by Gregory Keeley on 11/21/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct GroceryList {
    var name = String()
//    var cost = Int()
//    var purchased = Bool()
    
    static var groceries = [
        GroceryList(name: "Bread"), GroceryList(name: "Eggs"), GroceryList(name: "Milk")
    ]
}
