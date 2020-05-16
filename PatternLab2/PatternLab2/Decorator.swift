//
//  Decorator.swift
//  PatternLab2
//
//  Created by Alex Koblik-Zelter on 2/29/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation

protocol Order {
    var price: Double {get set}
    var description: String {get set}
    func getOrderPrice()
    func getOrderDescription()
}

class BaseOrder: Order {
    var price: Double = 10000
    var description: String = "доставка DHL"
    func getOrderPrice() {
        print("price = \(price)")
    }
    
    func getOrderDescription() {
        print(self.description)
    }
}


final class SaveDeliveryOrder: Order {
    var price: Double
    
    var description: String
    
    private let order: Order
    func getOrderPrice() {
        print(self.price)
    }
    
    func getOrderDescription() {
        print(self.description)
    }
    
    required init(order: Order) {
        self.order = order
        self.price = order.price + 500
        self.description = order.description + " с повышенной безопасностью"
    }
}
