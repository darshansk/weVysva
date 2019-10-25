//
//  OneToOneCell.swift
//  weVysya
//
//  Created by Centura on 24/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class OneToOneCell: UITableViewCell {

    @IBOutlet weak var hostTextField: UILabel!
    @IBOutlet weak var guestTextField: UILabel!
    @IBOutlet weak var dateTextField: UILabel!
    @IBOutlet weak var notesTextField: UILabel!
    @IBAction func viewButton(_ sender: Any) {
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
