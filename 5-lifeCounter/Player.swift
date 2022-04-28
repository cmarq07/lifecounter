//
//  Player.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/26/22.
//

class Player {
    // Player's score
    var score: Int
    var name : String
    var out : Bool
    
    // Initialize the player's score
    init(score: Int) {
        self.score = score
        self.name = "Player"
        self.out = false
    }
    
    func setName(_ givenName : String) {
        self.name = givenName
    }
    
    func setOut() {
        out = true
    }
    
    func isOut() -> Bool {
        if(out) {
            return true
        } else {
            return false
        }
    }
    
    func add() {
        score += 1
    }
    
    func add(_ num: Int) {
        score += num
    }
    
    func subtract() {
        score -= 1
    }
    
    func subtract(_ num: Int) {
        score -= num
    }
}
