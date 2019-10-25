//
//  MeetingDatesCell.swift
//  weVysya
//
//  Created by Centura on 24/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class MeetingDatesCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var meetingDateLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var houseNameLabel: UILabel!
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
