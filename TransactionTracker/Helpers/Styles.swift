//
//  Styles.swift
//  TransactionTracker
//
//  Created by administrator on 8/29/19.
//  Copyright © 2019 mdoyle1. All rights reserved.
//

import Foundation
import UIKit

func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
    
    
    let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.black]
    let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]

    
    
    let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
    let subtitleString = NSAttributedString(string: "\(subtitle)\n", attributes: subtitleAttributes)
    
    titleString.append(subtitleString)
    
    
 return titleString

}
// create a function to format the dictionary titles and add the subtitles
// loop through all the headers
// create an array of strings

// concatenate attributed strings

