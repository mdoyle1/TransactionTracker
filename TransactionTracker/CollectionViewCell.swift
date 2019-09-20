//
//  CollectionViewCell.swift
//  TransactionTracker
//
//  Created by administrator on 8/22/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import UIKit
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var collectionViewCellRow: UILabel!
    
    public func setCollectionViewCellRow(forRow row: Int){
        
        collectionViewCellRow.text = tableViewArray[row].description
    
}
}
