//
//  Bridge.swift
//  PatternLab2
//
//  Created by Alex Koblik-Zelter on 2/19/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation

protocol SwiftBaseClassForObjC {
    func swiftMethod()
}

class SwiftBridge {
    private var swiftClass: SwiftBaseClassForObjC
    
    init(_ swiftClass: SwiftBaseClassForObjC) {
        self.swiftClass = swiftClass
    }
    
    func implement() {
        self.swiftClass.swiftMethod()
    }
}

class FirstSwiftController: SwiftBaseClassForObjC {
    func swiftMethod() {
        print("My swift controller")
    }
}

class AnotherSwiftController: SwiftBaseClassForObjC {
    func swiftMethod() {
        print("My another swift controller")
    }
}



