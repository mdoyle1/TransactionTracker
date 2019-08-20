//
//  DetailViewController.swift
//  TransactionTracker
//
//  Created by administrator on 8/17/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var accountLbl: UILabel!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLbl.text = date
        descriptionLbl.text = descript
        accountLbl.text = account
        amountLbl.text = amount
//       print(dateLbl?.text)
//        let popup = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
//        //dateLbl?.text="Fuck"
//        let lb = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
//        lb.text=date
//        popup.backgroundColor = UIColor.red
//        self.view.addSubview(popup)
//        popup.addSubview(lb)
//        lb.center = popup.center

    }
}
