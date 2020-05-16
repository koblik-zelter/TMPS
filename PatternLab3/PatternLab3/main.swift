//
//  main.swift
//  PatternLab3
//
//  Created by Alex Koblik-Zelter on 3/10/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


print("---------------Observer---------------")

let subscriber = Subscriber()
let subscriber1 = Subscriber()

NotificationManager.shared.addSubscriber(subscriber)
NotificationManager.shared.addSubscriber(subscriber1)

NotificationManager.shared.someLogic()

print("---------------Strategy---------------")

var strategy: PersistenceStrategy = CoreDataStrategy()

strategy.addItem(title: "Test")
strategy.getItems()
strategy.editItem(id: "0", newTitle: "New Title")
strategy.deleteItem(id: "0")

strategy = RealmStrategy()

strategy.addItem(title: "Test")
strategy.getItems()
strategy.editItem(id: "0", newTitle: "New Title")
strategy.deleteItem(id: "0")

print("---------------Momento---------------")

var player = Player(name: "Player 1")
let game = Game(player: player)
game.start()
game.killPlayer()

print("---------------Chain of responsibility---------------")
let handler1 = CheckServerHandler()
let handler2 = CheckEmailHandler()
let handler3 = AdminHandler()
handler1.setNext(handler: handler2)
handler2.setNext(handler: handler3)
handler1.handle(email: "email@gmail.com", password: "test1231244")

print("---------------Template Method---------------")

let local = LocalWebViewPage()
let external = ExternalWebViewPage()

local.method()
external.method()
