//
//  BusinessCollectionViewCell.swift
//  GPay Clone
//
//  Created by Jovial on 9/12/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class BusinessCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var businessName: UILabel!
    
    override func awakeFromNib() {
        businessImage.layer.cornerRadius = businessImage.bounds.height / 2
    }
}
