//
//  RespChain.swift
//  PatternLab3
//
//  Created by Alex Koblik-Zelter on 3/28/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation

protocol Handler: class {
    func setNext(handler: Handler)
    func handle(email: String, password: String)

    var nextHandler: Handler? { get set }
}

extension Handler {

    func setNext(handler: Handler) {
        self.nextHandler = handler
    }

    func handle(email: String, password: String) {
        nextHandler?.handle(email: email, password: password)
    }
}


class CheckEmailHandler: Handler {
    var nextHandler: Handler?
    func handle(email: String, password: String) {
        if email.contains("@") {
            print("Progressing email and password")
            nextHandler?.handle(email: email, password: password)
        }
        else {
            print("Invalid Request")
        }
    }
}

class CheckServerHandler: Handler {
    var nextHandler: Handler?
    var isLimitOfRequests: Bool = false // if true => print "Limit of requests"
    
    func handle(email: String, password: String) {
        if (isLimitOfRequests) {
            print("Limit of requests")
            print("Try again")
        }
        else {
            nextHandler?.handle(email: email, password: password)
        }
    }
}

class AdminHandler: Handler {
    var nextHandler: Handler?
    
    func handle(email: String, password: String) {
        if (email.contains("cobl")) {
            print("Hello Cobl!")
        }
        else {
           print("Hello User")
        }
    }
}
