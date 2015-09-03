//
//  TableViewCell.swift
//  Week4-Assignment
//
//  Created by tho dang on 2015-09-03.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var landmarkPics: UIImageView!
    
    @IBOutlet weak var detailLabels: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
