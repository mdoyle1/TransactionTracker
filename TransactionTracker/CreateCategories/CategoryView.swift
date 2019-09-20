//
//  CreateSet.swift
//  TransactionTracker
//
//  Created by toxicspu on 9/6/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

class CategoryView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryEntry: UITextField!
    
    @IBAction func submitCategory(_ sender: Any) {
        print(categoryEntry.text!)
        let category = categoryEntry.text!
        catagoryArray.append(category)
        categoryEntry.text = ""
        print(catagoryArray.count)
        tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return catagoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
        let categoryItem = catagoryArray[indexPath.row]
        cell.categoryLabel.text = categoryItem
        print(catagoryArray[indexPath.row])
       // cell.categoryLabel.text = categoryEntry.text
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}
