//
//  MeetingDatesViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class MeetingDatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var meetingDatesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assign Delegates
        meetingDatesTableView.delegate = self
        meetingDatesTableView.dataSource = self
        //Registering the nib file
              meetingDatesTableView.register(UINib(nibName: "MeetingDatesCell", bundle: nil), forCellReuseIdentifier: "meetingDatesCell")
              configureTableView()
    }
    

   //MARK:- Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = meetingDatesTableView.dequeueReusableCell(withIdentifier: "meetingDatesCell", for: indexPath) as! MeetingDatesCell
        return cell
    }
    func configureTableView(){
           meetingDatesTableView.rowHeight = 200.0
           meetingDatesTableView.estimatedRowHeight = 200.0
            
       }
}
