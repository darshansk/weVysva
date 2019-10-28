//
//  ViewDetailsCell.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class ViewDetailsCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
