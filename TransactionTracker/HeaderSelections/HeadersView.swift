//
//  ViewController2.swift
//  TransactionTracker
//
//  Created by administrator on 8/30/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

var firstLoad = 0
var feedModelArray = [HeadersTableViewCellModel]()

class HeadersView: UIViewController, UIDocumentPickerDelegate{
   
    
    @IBAction func backToMainView(_ sender: Any) {
        let firstViewController = (storyboard?.instantiateViewController(withIdentifier: "mainVC"))!
        self.present(firstViewController, animated:true, completion:nil)
    }
    
    
    
    func fillDataArray(){
        for index in 0..<headers.count{
            let newModel = HeadersTableViewCellModel()
            newModel.headerPicker = true
            newModel.header = headers[index]
            feedModelArray.append(newModel)
        }
        
        firstLoad = 1
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
            tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.delegate = self
        tableView.dataSource = self
        if firstLoad == 0 {
        fillDataArray()
        }
        tableView.reloadData()
    }}
    

extension HeadersView: UITableViewDataSource, UITableViewDelegate {
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
        cell.delegate = self
        cell.setupWithModel(model: feedModelArray[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}

extension HeadersView: HeaderTableViewCellDelegate{
    func didTappedSwitch(cell: HeaderTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)
        feedModelArray[indexPath!.row].headerPicker = cell.headerSwitch.isOn
        print(feedModelArray[indexPath!.row].header ?? "")
        print(feedModelArray[indexPath!.row].headerPicker)
    }
    
    
}
