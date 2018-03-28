//
//  eventCollectionViewCell.swift
//  Clitch
//
//  Created by Said Bachtarysev on 27/03/2018.
//  Copyright © 2018 Clitch. All rights reserved.
//

import UIKit

class eventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Set corner radius of the event cell
        let heightX = self.layer.frame.height * 0.015625
        let widthY = self.layer.frame.width * 0.015625
        self.layer.cornerRadius = (heightX + widthY)/2
        self.clipsToBounds = true
    }
}
