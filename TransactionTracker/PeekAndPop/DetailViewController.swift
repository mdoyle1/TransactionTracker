//
//  DetailViewController.swift
//  TransactionTracker
//
//  Created by administrator on 8/17/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

var categoryItems:[[String:String]] = [[:]]


class DetailViewController: UIViewController {
    @IBAction func returnToHome(_ sender: Any) {
        let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "mainVC"))!
        self.present(segwayViewController, animated:true, completion:nil)
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    //Currently this is adding a whole row.
    // Lets update this to only add the first 10 string charecters of a selected row.
    
    @IBAction func addItem(_ sender: UIButton) {
      //Get each item from row...
        for h in 0..<headers.count{
            var items = tableViewArray[currentRow][headers[h]]
           //If item is empty don't crash!!
            guard let processItem = items,!processItem.isEmpty else {
                print("the string is empty")
                return
            }
            
        //Append item to current category from picker view.
           categoryItems.append([currentSelection:processItem])
            for i in 0..<categoryItems.count{
            for (key,value) in categoryItems[i] {
                print("\(key) = \(value)")
                }}
           }
       

        
    }
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var accountLbl: UILabel!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.reloadAllComponents()
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
extension DetailViewController: UIDocumentPickerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catagoryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catagoryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSelection = catagoryArray[row]
        print(currentSelection)
    }
    
}
