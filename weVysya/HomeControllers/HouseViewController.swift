//
//  HouseViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class HouseViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableVIewOutlet: UITableView!
    @IBOutlet weak var topViewOutlet: UIView!
    @IBOutlet weak var selectHouseButton: UIButton!
    @IBOutlet weak var presidentCardView: UIView!
    @IBOutlet weak var presidentImage: UIImageView!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var houseNameLabel: UILabel!
   
    
    @IBAction func hubLeaderCallingButton(_ sender: Any) {
        
               
    }
       
    private var numberOfItems: Int = 0
    private var memberName: [String] = []
    private var phoneNo: [String] = []
    private var typeName: [String] = []
    private var photoImageURLList: [String] = []
    private var typeNameList: [String] = []
    private var companyName: [String] = []
    private var houseName: [String] = []
         let hubId: String = UserDefaults.standard.string(forKey: "hubId")!
    let url = URL(string: "https://quickworkz.com/wv/controller/housesLeaderList.php")!
    @IBOutlet weak var houseTableView: UITableView!
    override func viewDidLoad() {
      super.viewDidLoad()
 
       tableViewDelegate()
       if loadFlag == false{
           topViewOutlet.isHidden = true
           houseTableView.isHidden = true
       }
       else{
           topViewOutlet.isHidden = false
           houseTableView.isHidden = false
           loadData()
       }
         
    }
    
    
    func tableViewDelegate(){
        //assign tableview delegates
               houseTableView.delegate = self
               houseTableView.dataSource = self
               
               houseTableView.register(UINib(nibName: "HousesCell", bundle: nil), forCellReuseIdentifier: "houseCardCell")
                configureCell()
    }
    
    
    
    
    
    //MARK:- Data extration methods:
    func loadPresidentCard(){
        self.presidentImage.layer.cornerRadius = self.presidentImage.frame.width/2
            self.memberNameLabel.text = memberName[0]
            self.phoneNumberLabel.text = phoneNo[0]
            self.houseNameLabel.text = typeName[0]
            self.companyNameLabel.text = companyName[0]
        self.presidentImage.load(imageUrl: photoImageURLList[0])
            
                   
        
            
        }
        
         func loadData(){
            self.showSpinner(onView: self.view)
                let parameters: [String: String] = [
                    "token": UserDefaults.standard.string(forKey: "token")!, ];
                Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
                    if response.result.isSuccess{
                        var responseJSON: JSON = JSON(response.result.value!)
                       print(responseJSON)
                        print(selectedAppHouse)
                        for i in responseJSON["hubdata"].count{
                            print(responseJSON["hubdata"][i]["HubName"].stringValue)
                            if selectedAppHouse == responseJSON["hubdata"][i]["HubName"].stringValue
                            {
                                responseJSON = responseJSON["hubdata"][i]["typedata"]
                                self.numberOfItems = responseJSON.count
                                                
                                                for i in self.numberOfItems{
                                                        print("Check point: \(responseJSON)")
                                                self.typeNameList.append(responseJSON[i]["typeName"].stringValue)
                                                self.memberName.append(responseJSON[i]["memberdata"]["MemberName"].stringValue)
                                            self.photoImageURLList.append(responseJSON[i]["memberdata"]["PhotoURL"].stringValue)
                                                self.phoneNo.append(responseJSON[i]["memberdata"]["PhoneNo"].stringValue)
                                                self.companyName.append(responseJSON[i]["memberdata"]["CompanyName"].stringValue)
                                                self.typeName.append(responseJSON[i]["typeName"].stringValue)

                                                }
                                
                                                    print(self.memberName)
                                                    print(self.phoneNo)
                                                    print(self.typeName)
                                                    self.houseTableView.reloadData()
                                                    self.removeSpinner()
                            }
                            else{
                                  self.showToast(message: "No Data Found", color: UIColor.gray)
                            }
                            
                    }
                    
                    }
                    else{
                        print("Connection Eroor \(String(describing: response.result.error))")
                        self.showToast(message: "Connection Issues", color: UIColor.gray)
                    }
                }
            }
        
    
    
    
//MARK:- Table view Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if numberOfItems == 0{
            return numberOfItems}
        else{
             loadPresidentCard()
            return (numberOfItems-1)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = houseTableView.dequeueReusableCell(withIdentifier: "houseCardCell", for: indexPath) as! HousesCell
       cell.memberNameLabel.text = memberName[indexPath.row+1]
              cell.phoneNumberLabel.text = phoneNo[indexPath.row+1]
              cell.designationLabel.text = typeName[indexPath.row+1]
        let photourl = photoImageURLList[indexPath.row+1]
        cell.userImage.load(imageUrl: photourl)
        return cell
    }
    func configureCell(){
        houseTableView.rowHeight = 100.0
        houseTableView.estimatedRowHeight = 100.0
    }

}
