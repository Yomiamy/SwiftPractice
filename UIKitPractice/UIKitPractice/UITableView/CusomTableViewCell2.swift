//
//  CusomTableViewCell2.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/10/7.
//

import UIKit

class CusomTableViewCell2: UITableViewCell {
    
    
    @IBOutlet weak var lbItem: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setText(text: String) {
        self.lbItem.text = text
    }
    
}
