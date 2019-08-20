//
//  ParseMethods.swift
//  TransactionTracker
//
//  Created by administrator on 8/18/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation

class ParseMethods {
    
    func parseAccount(){
        for r in 1..<csvArray.count {
            if csvArray[r][headers[3]]!.contains(account){
                accountTransactions.append(csvArray[r])
                tableViewArray = accountTransactions}}
       
    }
    
    func parseTransactions(Array: [[String:String]]){
        tableViewArray = [[String:String]]()
        dictionaryItems = [String:String]()
        var columnsToExtract = [
            headers[1],
            headers[3],
            headers[4]
        ]
        for r in 0..<Array.count {
            for n in 0..<columnsToExtract.count {
                dictionaryItems[columnsToExtract[n]] = Array[r][columnsToExtract[n]]!
            }
            tableViewArray.append(dictionaryItems)
            
        }
    }
    
}
