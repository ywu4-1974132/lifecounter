//
//  ViewController.swift
//  lifecount2
//
//  Created by Sky Wu on 5/2/22.
//

import UIKit

var players: [player] = [player("player1"), player("player2"), player("player3"), player("player4")]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var history: [String] = []

    @IBOutlet weak var playerTable: UITableView!
    @IBOutlet weak var addButton: UIButton!

//    @IBAction func addLife(_ sender: UIButton) {
//        print(playerTable.indexPathForSelectedRow!)
//    }
//    

    
    
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
        playerTable.reloadData()
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
    
    @IBAction func addPlayer(_ sender: UIButton) {
        //if(gameOver() || gameNotStart()){
        let alert = UIAlertController(title: "Add Player", message: "Pick a name!", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {[weak alert] (_)in
            let input = alert?.textFields![0]
            if(input?.text != "" && self.gameNotStart()){
                players.append(player(input!.text!))
                self.playerTable.reloadData()
            }
        }))
        self.present(alert, animated: true)

    }
    
    
    @IBAction func removePlayer(_ sender: Any) {
        if(players.count > 2 && gameNotStart()){
            players.removeLast()
            playerTable.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = playerTable.dequeueReusableCell(withIdentifier: "playerCell") as! TableViewCell
        cell.playerX.text = players[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Rename", message: "Pick a name!", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: {[weak alert] (_)in
            let input = alert?.textFields![0]
            if(input?.text != ""){
                players[indexPath.row].name = input!.text!
                self.playerTable.reloadData()
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

