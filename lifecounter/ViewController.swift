//
//  ViewController.swift
//  lifecounter
//
//  Created by Sky Wu on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    var player1LifeCount = 20
    var player2LifeCount = 20
    
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    
    @IBAction func player1PlusOne(_ sender: Any) {
        player1LifeCount += 1
        updatePlayer1LifeCount()
    }
    
    @IBAction func player1MinusOne(_ sender: Any) {
        player1LifeCount -= 1
        updatePlayer1LifeCount()
    }
    
    @IBAction func player1PlusFive(_ sender: Any) {
        player1LifeCount += 5
        updatePlayer1LifeCount()
    }
    
    @IBAction func player1MinusFive(_ sender: Any) {
        player1LifeCount -= 5
        updatePlayer1LifeCount()
    }
    
    @IBAction func player2PlusOne(_ sender: Any) {
        player2LifeCount += 1
        updatePlayer2LifeCount()
    }
    
    @IBAction func player2MinusOne(_ sender: Any) {
        player2LifeCount -= 1
        updatePlayer2LifeCount()
    }
    
    @IBAction func player2PlusFive(_ sender: Any) {
        player2LifeCount += 5
        updatePlayer2LifeCount()
    }
    
    @IBAction func player2MinusFive(_ sender: Any) {
        player2LifeCount -= 5
        updatePlayer2LifeCount()
    }
    
    
    func updatePlayer1LifeCount(){
        if player1LifeCount > 0 {
            player1.text = "P1: \(player1LifeCount)"
        } else {
            player1.text = "Player 1 LOSES!"
        }
    }
    
    func updatePlayer2LifeCount(){
        if player2LifeCount > 0{
            player2.text = "P2: \(player2LifeCount)"
        } else{
            player2.text = "Player 2 LOSES!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updatePlayer1LifeCount()
        updatePlayer2LifeCount()
    }


}

