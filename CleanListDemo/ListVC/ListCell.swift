//
//  ListCell.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 13/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
        {
            widthConstraint.constant = (UIScreen.main.bounds.size.width / 2) - 40
        } else {
            widthConstraint.constant = UIScreen.main.bounds.size.width - 20
        }
        
        // Initialization code
    }

}
