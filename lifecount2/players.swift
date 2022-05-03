//
//  players.swift
//  lifecount2
//
//  Created by Sky Wu on 5/2/22.
//

import Foundation

class player{
    var life: Int
    var name: String
    
    init(_ name: String){
        life = 20
        self.name = name
    }
    
    func addLife(_ num: Int){
        life += num
    }
    
    func subtractLife(_ num: Int){
        life -= num
    }
    
    //return true when this player's life is equal or less than 0
    func gameOver() -> Bool {
        return life <= 0
    }
}
