//
//  PeopleCollectionViewCell.swift
//  GPay Clone
//
//  Created by Jovial on 9/12/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var peopleName: UILabel!
    
    override func awakeFromNib() {
        peopleImage.layer.cornerRadius = peopleImage.bounds.height / 2
    }
}
