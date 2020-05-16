//
//  Observer.swift
//  PatternLab3
//
//  Created by Alex Koblik-Zelter on 3/10/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


class NotificationManager {
    
    static let shared = NotificationManager()
   
    private init() {
        
    }
    
    private var subscribers: [Subscriber] = []
    
    func addSubscriber(_ subscriber: Subscriber) {
        self.subscribers.append(subscriber)
    }
    
    func deleteSubscriber(_ subscriber: Subscriber) {
        if let index = self.subscribers.firstIndex(where: { $0 === subscriber }) {
            print("remove element \(subscribers[index]) at index \(index)")
            self.subscribers.remove(at: index)
        }
    }
    
    func someLogic() {
        print("We got some new data so we need to notify our subscribers")
        self.notify()
    }
    
    private func notify() {
        self.subscribers.forEach { (subscriber) in
            subscriber.update()
        }
    }
}

class Subscriber: Notificationable {
    func update() {
        print("I get some signal")
    }
}

protocol Notificationable {
    func update()
}
