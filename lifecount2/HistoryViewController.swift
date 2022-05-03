//
//  HistoryViewController.swift
//  lifecount2
//
//  Created by Sky Wu on 5/2/22.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contentText: String = ""

    
    @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var historyTable: UITableView!
    
    @IBAction func backToMain(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTable.dequeueReusableCell(withIdentifier: "historyCell")
        cell?.textLabel?.text = history[indexPath.row]
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.delegate = self
        historyTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
