//
//  DetailsCard.swift
//  weVysya
//
//  Created by Centura on 24/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class LinksCard: UITableViewCell {

    @IBOutlet weak var memberTextField: UILabel!
    @IBOutlet weak var linkImage: UIImageView!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var linkTextField: UILabel!
    @IBOutlet weak var phoneTextField: UILabel!
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
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
