//
//  HistoryViewController.swift
//  lifecount2
//
//  Created by Sky Wu on 5/2/22.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var contentText: String = ""

    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var goBack: UIButton!
    
    
    @IBAction func backToMain(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        content.text = contentText
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
