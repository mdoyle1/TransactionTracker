//
//  Settings.swift
//  TransactionTracker
//
//  Created by administrator on 9/1/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

class Settings: UIViewController{
    

    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Enter details?", message: "Enter the name of a catagory you would like to create.", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let catagory = alertController.textFields?[0].text
            //  let email = alertController.textFields?[1].text
            catagoryArray.append(catagory!)
            //self.catagoryLabel.text = "Catagory: " + catagory!
            print(catagoryArray)
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter catagory name here..."
        }
//        alertController.addTextField { (textField) in
//            textField.placeholder = "Enter Email"
//        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func createCatagory(_ sender: Any) {
        //showInputDialog()
        let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "Categories"))!
        self.present(segwayViewController, animated:true, completion:nil)
    }
    
    @IBAction func setHeaders(_ sender: Any) {
        let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "HeaderVC"))!
        self.present(segwayViewController, animated:true, completion:nil)
    }
    
    @IBAction func listItems(_ sender: Any) {
        let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "ListItems"))!
        self.present(segwayViewController, animated:true, completion:nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
