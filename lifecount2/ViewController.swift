//
//  ViewController.swift
//  lifecount2
//
//  Created by Sky Wu on 5/2/22.
//

import UIKit

var players: [player] = [player("player1"), player("player2"), player("player3"), player("player4")]
var history: [String] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var playerTable: UITableView!
    @IBOutlet weak var addButton: UIButton!

    
    func reloadData(){
        playerTable.reloadData()
        gameOverDisplay()
        
        
    }
    
    @IBAction func changeLife(_ sender: Any) {
        let button = sender as! UIButton
        let cell = button.superview?.superview as! TableViewCell
        let index = playerTable.indexPath(for: cell)
        let player = players[(index?.row)!]
        let inputBox = cell.inputBox
        if(inputBox?.text != ""){
            if Int(inputBox?.text ?? "0") == nil {
                let alert = UIAlertController(title: "Attention!", message: "You can only put numbers in the box!", preferredStyle: .alert)
                //alert.addAction(UIAlertAction(title: "OK", style: .default))
                let action = UIAlertAction(title: "ok", style: .default) { _ in
                    self.view.endEditing(true)
                }
                alert.addAction(action)
                playerTable.reloadData()
                self.present(alert, animated: true)
            }else{
                if button == cell.addButton {
                    player.addLife(Int(inputBox?.text ?? "0")!)
                    history.append("\(player.name) gains \(inputBox?.text ?? "0") life.")
                }else{
                    player.subtractLife(Int(inputBox?.text ?? "0")!)
                    history.append("\(player.name) loses \(inputBox?.text ?? "0") life.")
                }
            }
        }
        inputBox!.text = ""
        if player.gameOver(){
            player.name += " LOSES!"
            history.append("\(player.name) Sorry!")
        }
        reloadData()
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowHistory" {
                if let hisVC = segue.destination as? HistoryViewController {
                    hisVC.contentText = "\(history)"
                }
            }
        }
    
    @IBAction func reset(_ sender: Any) {
        players = [player("player1"), player("player2"), player("player3"), player("player4")]
        history = []
        //clean text input
        reloadData()
    }

    
    func gameNotStart() -> Bool{
        for player in players{
            if player.life != 20 {
                return false
            }
        }
        return true
    }
    
    func gameOver() -> Bool{
        var count = 0
        for player in players{
            if player.gameOver() == true {
                count += 1
            }
        }
        return !(players.count - count > 1)
    }
    
    func gameOverDisplay(){
        if self.gameOver() {
            history.append("Game Over!")
            let alert = UIAlertController(title: "Game Over!", message: "Sorry Please Restart!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_)in
                    players = [player("player1"), player("player2"), player("player3"), player("player4")]
                    self.playerTable.reloadData()
                }))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func addPlayer(_ sender: UIButton) {
        //if(gameOver() || gameNotStart()){
        let alert = UIAlertController(title: "Add Player", message: "Pick a name!", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {[weak alert] (_)in
            let input = alert?.textFields![0]
            if(input?.text != "" && self.gameNotStart()){
                players.append(player(input!.text!))
                history.append("\(input?.text ?? "") is added to the game! Welcom!")
                self.reloadData()
            }
        }))
        self.present(alert, animated: true)

    }
    
    
    @IBAction func removePlayer(_ sender: Any) {
        if(players.count > 2 && gameNotStart()){
            history.append("\(players.last?.name ?? "") is removed from the game.")
            players.removeLast()
            reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = playerTable.dequeueReusableCell(withIdentifier: "playerCell") as! TableViewCell
        cell.playerX.text = players[indexPath.row].name
        cell.lifeCount.text = String(players[indexPath.row].life)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Rename", message: "Pick a name!", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: {[weak alert] (_)in
            let input = alert?.textFields![0]
            if(input?.text != ""){
                history.append("The name \(players[indexPath.row].name) is changed to\(input?.text ?? "")!")
                players[indexPath.row].name = input!.text!
                self.reloadData()
            }
        }))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerTable.delegate = self
        playerTable.dataSource = self
    }


}

