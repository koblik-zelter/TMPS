//
//  main.swift
//  PatternLab2
//
//  Created by Alex Koblik-Zelter on 2/16/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation

print("---------------ADAPTER---------------")

let child = JsonReader()
child.readData()
let anotherChild = XMLReader()
let adapter = Adapter(reader: anotherChild)
adapter.readData()
print("---------------BRIDGE---------------")

let abstr = SwiftBridge(FirstSwiftController())
abstr.implement()
let anotherAbstr = SwiftBridge(AnotherSwiftController())
anotherAbstr.implement()

print("---------------FACADE---------------")

let soa = AQIFacade()
print(soa.getAqi())

print("---------------PROXY---------------")

let url = URL(string: "https://www.google.com")!
var proxy = Proxy(service: URLImageService())
proxy.loadImage(url: url) { (image) in
    print(image)
}
proxy.loadImage(url: url) { (image) in
    print(image)
}

print("---------------DECORATOR---------------")

let baseOrder = BaseOrder()
let betterDecorator = SaveDeliveryOrder(order: baseOrder)

baseOrder.getOrderPrice()
baseOrder.getOrderDescription()
betterDecorator.getOrderPrice()
betterDecorator.getOrderDescription()
