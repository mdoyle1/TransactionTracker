//
//  TableViewCell.swift
//  TransactionTracker
//
//  Created by administrator on 8/21/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
   // @IBOutlet private weak var collectionView: UICollectionView!

    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var tableLable: UITextField!
    
//    func setTableLable(
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UIScrollViewDelegate, forRow row: Int) {
        scrollView.delegate = dataSourceDelegate
      //  collectionView.dataSource = dataSourceDelegate
        scrollView.tag = row
       // collectionView.reloadData()
    }
}
