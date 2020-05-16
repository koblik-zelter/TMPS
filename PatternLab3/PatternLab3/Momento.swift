//
//  Momento.swift
//  PatternLab3
//
//  Created by Alex Koblik-Zelter on 3/26/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


class Player {
    var level: Int
    var name: String
    init(level: Int = 0, name: String) {
        self.level = level
        self.name = name
    }
    
    func levelUp() {
        self.level += 1
        print("Level up, current level = \(self.level)")
    }
    
    func restore(momento: Momento?) {
        guard let momento = momento else {
            print("No saves! The End!")
            return
        }
        self.level = momento.getLevel()
        print("restore on level \(self.level)")
    }
    
    func save() -> Momento {
        return Momento(level: self.level)
    }
    
    
}

class Game {
    var player: Player
    var careTaker = CareTaker()
    
    init(player: Player) {
        self.player = player
    }
    
    func start() {
        print("Some Logic")
        player.levelUp()
        self.careTaker.addSave(level: player.save())
        player.levelUp()
        player.levelUp()
        player.levelUp()
        player.levelUp()
        player.levelUp()

    }
    
    func killPlayer() {
        player.restore(momento: self.careTaker.getMomento())
    }
}

class CareTaker {
    var momentos: [Momento] = []
    
    func getMomento() -> Momento? {
        return momentos.last
    }
    
    func addSave(level: Momento) {
        self.momentos.append(level)
    }
    
    
    
}

class Momento {
    var level = 0
    
    init(level: Int) {
        self.level = level
    }
    
    func getLevel() -> Int {
        return self.level
    }
}
