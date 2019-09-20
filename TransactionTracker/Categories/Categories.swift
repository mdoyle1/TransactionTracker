//
//  Categories.swift
//  TransactionTracker
//
//  Created by toxicspu on 9/9/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

class Categories: UIViewController{
    
    @IBAction func backToHome(_ sender: Any) {
        let firstViewController = (storyboard?.instantiateViewController(withIdentifier: "mainVC"))!
        self.present(firstViewController, animated:true, completion:nil)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoriesText: UITextField!
    
    @IBAction func submitCategories(_ sender: Any) {
        let category = categoriesText.text!
        catagoryArray.append(category)
        categoriesText.text = ""
        print(catagoryArray.count)
        tableView.reloadData()
        
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
          tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "categoriesCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
    
    
    extension Categories: UITableViewDataSource, UITableViewDelegate{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell") as! CategoriesCell
        let categoryItem = catagoryArray[indexPath.row]
        cell.categoriesLabel.text = categoryItem
        print(catagoryArray[indexPath.row])
        // cell.categoryLabel.text = categoryEntry.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}
