//
//  MemberListCell.swift
//  weVysya
//
//  Created by Centura on 25/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class MemberListCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var comanyNameLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBAction func phoneCallingButton(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
