//
//  ListDictionaries.swift
//  TransactionTracker
//
//  Created by toxicspu on 9/7/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation


var listDictionaries:[[String:String]] = [[:]]

func addListItem(listItem: [String:String]){
    listDictionaries.append(listItem)
}
