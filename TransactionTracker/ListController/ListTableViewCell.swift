//
//  ListTableViewCell.swift
//  TransactionTracker
//
//  Created by administrator on 9/3/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var listButton: UIButton!
 
    
    func setupWithModel(model: ListTableViewCellModel){
        listButton.titleLabel!.text = model.buttonLabel
    }
    var listsArray:[String] = []
    
    func fillDataArray(){
        for index in 0..<headers.count{
            //listButton.titleLabel?.text = headers[index]
            listsArray.append(headers[index])
        }
        
       // firstLoad = 1
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
