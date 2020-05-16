//
//  Strategy.swift
//  PatternLab3
//
//  Created by Alex Koblik-Zelter on 3/28/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


class Item {
    var id = ""
    var title = ""
}


protocol PersistenceStrategy: class {
    var title: String { get }
    
    func addItem(title: String)
    func getItems()
    func editItem(id: String, newTitle: String)
    func deleteItem(id: String)
}


class CoreDataStrategy: PersistenceStrategy {
    var title: String = "Core Data Strategy"
    
    func addItem(title: String) {
        print("Prepare item with title: \(title) for save in Core Data")
    }
    
    func getItems() {
        print("List of items from Core Data Storage")
    }
    
    func editItem(id: String, newTitle: String) {
        print("Edit item with id: \(id) in Core Data")
    }
    
    func deleteItem(id: String) {
        print("delete item with id: \(id) from Core Data")
    }
}

class RealmStrategy: PersistenceStrategy {
    var title: String = "Realm Strategy"
    
    func addItem(title: String) {
        print("Prepare item with title: \(title) for save in Realm")
    }
    
    func getItems() {
        print("List of items from Realm Storage")
    }
    
    func editItem(id: String, newTitle: String) {
        print("Edit item with id: \(id) in Realm")
    }
    
    func deleteItem(id: String) {
        print("delete item with id: \(id) from Realm")
    }
}


