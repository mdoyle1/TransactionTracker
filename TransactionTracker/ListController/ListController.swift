//
//  ListController.swift
//  TransactionTracker
//
//  Created by administrator on 9/3/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

// I'd like to create sets on the fly
// Using a button and a text field
// First the user would specify/create a catagory
// then add content to the catagory.
// the content would be somthing like a string with 10 charecters.


var modelArray = [ListTableViewCellModel]()
class ListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    func fillDataArray(){
        for index in 0..<listItems.count{
            let newModel = ListTableViewCellModel()
            newModel.buttonLabel = listItems[index]
            modelArray.append(newModel)
        }
    }
   
    @IBAction func back(_ sender: Any) {
        let firstViewController = (storyboard?.instantiateViewController(withIdentifier: "mainVC"))!
        self.present(firstViewController, animated:true, completion:nil)
    }
    
    override func viewDidLoad() {
            tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "listTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        fillDataArray()
        tableView.reloadData()
    }
}

extension ListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell") as! ListTableViewCell
       
        cell.listButton.setTitle(listItems[indexPath.row], for: .normal)
        print(listItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}
