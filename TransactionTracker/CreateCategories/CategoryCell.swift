//
//  CatagoryCell.swift
//  TransactionTracker
//
//  Created by toxicspu on 9/8/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import UIKit


class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBAction func addCategory(_ sender: Any) {
    }
    
    @IBAction func removeCategory(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
