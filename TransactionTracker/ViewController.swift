//
//  ViewController.swift
//  TransactionTracker
//
//  Created by administrator on 8/11/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import UIKit

var controller = ViewController()
var parse = ParseMethods()
var csv = CSVaccessability()
var globalPathToCsv:URL!
var csvArray = [[String:String]]()
var dictionaryItems=[String:String]()
var accountTransactions = [[String:String]]()
var tableViewArray = [[String:String]]()
var pickerData: [String] = [String]()
var account:String!
var currentSelection:String!
var date:String!
var descript:String!
var amount:String!
var accountType:String!

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIDocumentPickerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIViewControllerPreviewingDelegate{
    @IBOutlet weak var customCell: UITableViewCell!
    
    @IBOutlet weak var itemsToSort: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func detailViewController(for index: Int) -> DetailViewController {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else {
            fatalError("Couldn't load detail view controller")
        }
        return vc
    }

    
    func loadCSV(){
        csv.csvToList()
        tableViewArray = csvArray
        tableView.reloadData()
    }
    
   
    @IBAction func updateView(_ sender: Any) {
        
        if currentSelection == "Kelly's Transactions"{
            account = ""
        parse.parseTransactions(Array: csvArray)
        parse.parseAccount()
        }
        
        let totalSections = tableView.numberOfSections
    
        for section in 0..<totalSections{
            let totalNumberOfRows = tableView.numberOfRows(inSection: section)
           
            for row in 0..<totalNumberOfRows{
                let cell = tableView.cellForRow(at: IndexPath(row: row, section: section))
                let label = cell?.textLabel!.text
                let accountString = label?.suffix(5)
                
            }
        }
      tableView.reloadData()
    }
    
    

    
 
    
    @IBAction func importCSV(_ sender: UIButton) {
        let documentPicker: UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.item"], in: UIDocumentPickerMode.import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(documentPicker, animated: true, completion: nil)
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForPreviewing(with: self, sourceView: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        self.itemsToSort.delegate = self
        self.itemsToSort.dataSource = self
         pickerData = ["All Transactions","Kelly's Transactions", "Mark's Transactions", "Gas", "Shopping", "Fastfood", "Places", "Grocery", "Bank Transfers", "Withdrawels", "Medical", "Deposits", "Bills", "Unknown"]
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        currentSelection = pickerData[row]
 
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("URL: \(url)")
        globalPathToCsv = url
        loadCSV()
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
//        if let dateTable = tableViewArray[indexPath.row]["Date"] {
//            dateLabel.text = dateTable
//        cell.contentView.addSubview(dateLabel)
//        }
//
//        if let descriptionTable = tableViewArray[indexPath.row]["Description"]{
//            descriptionLabel.text = descriptionTable
//            cell.contentView.addSubview(descriptionLabel)
//        }
        
        cell.textLabel?.text = tableViewArray[indexPath.row]["Description"]

       // cell.textLabel?.text = tableViewArray[indexPath.row]["Date"]
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableViewArray[indexPath.row])
        print(tableViewArray[indexPath.row]["Date"] as Any)
        
        let vc = detailViewController(for: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
       
      
    }
    
    
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRow(at: location) {
            date = tableViewArray[indexPath.row]["Date"]
            descript = tableViewArray[indexPath.row]["Description"]
            amount = tableViewArray[indexPath.row]["Amount"]
            accountType = tableViewArray[indexPath.row]["Account Type"]

            previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
            return detailViewController(for: indexPath.row)
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: false)
       
    }
  

    
    
    
}



