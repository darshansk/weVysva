//
//  faqCustomCell.swift
//  weVysya
//
//  Created by Centura on 29/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class faqCustomCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstViewLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var secondHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var showsDetails = false {
        didSet{
            secondHeightConstraint.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue(showsDetails ? 250 : 999))
        }
    }
}
