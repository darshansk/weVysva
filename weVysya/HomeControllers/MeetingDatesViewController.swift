//
//  MeetingDatesViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MeetingDatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var meetingDatesTableView: UITableView!
    var numberofItems: Int = 0
      var houseNameList: [String] = []
      var subjectList: [String] = []
      var dateList: [String] = []
      var addressList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        loadData()
        
        //Assign Delegates
        meetingDatesTableView.delegate = self
        meetingDatesTableView.dataSource = self
        //Registering the nib file
              meetingDatesTableView.register(UINib(nibName: "MeetingDatesCell", bundle: nil), forCellReuseIdentifier: "meetingDatesCell")
              configureTableView()
    }
    
    
    //MARK:- Load Data
    func loadData(){
        let url = URL(string: "https://quickworkz.com/wv/controller/meeting.php?type=MeetingDateList")!
        let parameters:[String: String] = [
            "token": UserDefaults.standard.string(forKey: "token")!,
            "house":  UserDefaults.standard.string(forKey: "hubName")!
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess{
                
                var responseJSON: JSON = JSON(response.result.value!)
                if responseJSON["flag"] == "1"{
                    
                    responseJSON = responseJSON["meetingdatelist"]
                    self.numberofItems = responseJSON.count
                    for i in self.numberofItems{
                        
                    self.houseNameList.append(responseJSON[i]["HubName"].stringValue)
                    self.subjectList.append(responseJSON[i]["subject"].stringValue)
                    self.dateList.append(responseJSON[i]["startDate"].stringValue)
                        self.addressList.append(responseJSON[i]["location"].stringValue)
                        
                    }
                    self.meetingDatesTableView.reloadData()
                    self.removeSpinner()
                }
                
            }
        }
    }
   //MARK:- Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberofItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = meetingDatesTableView.dequeueReusableCell(withIdentifier: "meetingDatesCell", for: indexPath) as! MeetingDatesCell
        cell.houseNameLabel.text = houseNameList[indexPath.row]
        cell.subjectLabel.text = subjectList[indexPath.row]
        cell.meetingDateLabel.text = dateList[indexPath.row]
        cell.addressLabel.text = addressList[indexPath.row]
        return cell
    }
    func configureTableView(){
           meetingDatesTableView.rowHeight = 200.0
           meetingDatesTableView.estimatedRowHeight = 200.0
            
       }
}
