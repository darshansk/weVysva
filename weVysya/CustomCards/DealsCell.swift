//
//  DealsCell.swift
//  weVysya
//
//  Created by Centura on 25/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class DealsCell: UITableViewCell {
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var amountImage: UIImageView!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var dealImage: UIImageView!
    @IBOutlet weak var notesImage: UIImageView!
    @IBOutlet weak var fromMemberLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dealLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var fromMemberTextField: UILabel!
    @IBOutlet weak var amountTextField: UILabel!
    @IBOutlet weak var phoneTextField: UILabel!
    @IBOutlet weak var dealTextField: UILabel!
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
