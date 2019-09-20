//
//  HeaderTableViewCell.swift
//  TransactionTracker
//
//  Created by administrator on 8/30/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import UIKit
protocol HeaderTableViewCellDelegate {
    func didTappedSwitch(cell:HeaderTableViewCell)}

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerSwitch: UISwitch!
    @IBOutlet weak var headerLabel: UILabel!
    var delegate: HeaderTableViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupWithModel(model: HeadersTableViewCellModel){
        headerLabel.text = model.header
        headerSwitch.setOn(model.headerPicker, animated: false)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        delegate.didTappedSwitch(cell:self)
    }
}
