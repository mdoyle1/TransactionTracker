//
//  Lists.swift
//  transactionsSwift
//
//  Created by administrator on 7/2/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import Foundation

var catagoryArray:[String] = []

public var HEADERS:Set<String>=[
    "Description"
]
public var headersLength=HEADERS.count

public var GAS:Set<String>=[
    "SUNOCO",
    "CUMBERLAND",
    "MOBIL",
    "BESTWAY",
    "AMORE FUEL",
    "CHUCKY'S",
    "GULF"
]
public var gasLength=GAS.count
public var gasTransactions = [[String:String]]()

public var SHOPPING:Set<String>=[
    "PETCO",
    "DOLLAR GENERAL",
    "HOME DEPOT",
   
]
public var shoppingLength=SHOPPING.count
public var shoppingTransactions = [[String:String]]()

public var FASTFOOD:Set<String>=[
    "MCDONALD'S",
    "DUNKIN",
    "BAKERS DOZEN",
    "STARBUCKS",
    
]
public var fastfoodLength=FASTFOOD.count
public var fastfoodTransactions = [[String:String]]()

public var MEDICAL:Set<String>=[
    "PARTNERS HEALTHCAR",
    "YALE"
]
public var medicalLength=MEDICAL.count
public var medicalTransactions = [[String:String]]()

public var GROCERY:Set<String>=[
    "BETTER-VALU",
    "WAL-MART"
]
public var groceryLength=GROCERY.count
public var groceryTransactions = [[String:String]]()

public var WITHDRAWELS:Set<String>=[
    "16 RAILROAD"]
public var withdrawelsLength=WITHDRAWELS.count
public var withdrawelsTransactions = [[String:String]]()

public var DEPOSITS:Set<String>=[
    "PAYROLL",
    "DDA DEBIT"
]
public var depositsLength=DEPOSITS.count
public var depositsTransactions = [[String:String]]()

public var BILLS:Set<String>=[
    "ITUNES",
    "Amazon Prime",
    "ATM FEE",
]
public var billLength=BILLS.count
public var billTransactions = [[String:String]]()

public var PLACES:Set<String>=[
    "JUMP OFF",
    "SOUTHWICK`S ZOO",
    "BOUNCE",
    "SANTAS VILLAGE",
    "SKATE INN",
    "CITY OF MIDDLETOWN",
    "GILLETTE CASTLE",
    "QUESTERS WAY",
    "THE KIDCITY",
    "RESIDENCE INN",
    "The Kidcity",
    "TOP OF THE ROCK",
    "YMCA",
]
public var placesLength=PLACES.count
public var placesTransactions = [[String:String]]()

public var BANKTRANSFERS:Set<String>=[
    "FROM SAVINGS",
    "SCHEDULED TRANSFER"
]
public var bankTransfers=BANKTRANSFERS.count
public var bankTransactions = [[String:String]]()

public var listItems:[String] = ["Gas","Shopping","Fastfood","Medical","Grocery","Withdrawels","Bills","Places","Banktransfers","Deposits"]

public var TRANSACTIONS:Set = [GAS, SHOPPING, FASTFOOD, MEDICAL, GROCERY, WITHDRAWELS, BILLS, PLACES, BANKTRANSFERS, DEPOSITS]
public var transactionsLength=TRANSACTIONS.count
public var unknownTransactions = [[String:String]]()

public func clearAll(){
    csvArray.removeAll()
  //  accountTransactions.removeAll()
//    accountBtransactions.removeAll()
    gasTransactions.removeAll()
    bankTransactions.removeAll()
    placesTransactions.removeAll()
    billTransactions.removeAll()
    groceryTransactions.removeAll()
    medicalTransactions.removeAll()
    fastfoodTransactions.removeAll()
    shoppingTransactions.removeAll()
    
}


/*
#Below Prints all the contentents of the lists in the TRANSACTIONS list
#Next Step is to print each list item line by line
'''
for counter, _ in enumerate(range(transactionsLength)):
    count = len(TRANSACTIONS[counter])
    trans = TRANSACTIONS[counter]
    print(count)
for index, _ in enumerate(range(count)):
    #trans[index]
    print(trans[index])
    
    #Now implement this into the sorting method!
    '''
*/
