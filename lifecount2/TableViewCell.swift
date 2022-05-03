//
//  TableViewCell.swift
//  lifecount2
//
//  Created by Sky Wu on 5/2/22.
//

import UIKit

class TableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    @IBOutlet weak var playerX: UILabel!
    @IBOutlet weak var inputBox: UITextField!
    @IBOutlet weak var lifeCount: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if let _ = text.rangeOfCharacter(from: NSCharacterSet.decimalDigits){
//            return true
//        }else{
//            return false
//        }
//    }
    

    
}
