//
//  MemberListViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MemberListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var selectHouseButton: UIButton!
    @IBOutlet weak var memberListTableView: UITableView!

      let memberurl = URL(string: "https://quickworkz.com/wv/controller/memberlist.php?type=HubWiseMemberList")!
    
     var memberNameList: [String] = []
    var companyList: [String] = []
    var categoryList: [String] = []
    var phoneNoList: [String] = []
    var imageUrlList: [String] = []
    var responseJSON: JSON!
    private var numberOfItems: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
      tableDelegateMethods()
        getMembers()
        memberListTableView.reloadData()
    }
    
//MARK:- Networking for Members Data
    //Networking for MemberList
             
             func getMembers(){
                 let parameters: [String: String] = [
                     "token": UserDefaults.standard.string(forKey: "token")!]
                 Alamofire.request(memberurl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
                     if response.result.isSuccess{
                         self.responseJSON = JSON(response.result.value!)
                       print("The response is \(self.responseJSON)")
                         let count = self.responseJSON["Hubwisememberlistdetails"].count
                         print("count \(count)")
                         for i in count{
                            
                             if selectedAppHouse == self.responseJSON["Hubwisememberlistdetails"][i]["HubName"].stringValue{
                                 self.responseJSON = self.responseJSON["Hubwisememberlistdetails"][i]["memlist"]
                                print("Members are \(self.responseJSON)")
                                 self.numberOfItems = self.responseJSON.count
                             
                                 for i in self.numberOfItems{
                                     self.memberNameList.append(self.responseJSON[i]["MemberName"].stringValue)
                                    self.companyList.append(self.responseJSON[i]["CompanyName"].stringValue)
                                    self.categoryList.append(self.responseJSON[i]["Category"].stringValue)
                                    self.phoneNoList.append(self.responseJSON[i]["PhoneNumber"].stringValue)
                                    self.imageUrlList.append(self.responseJSON[i]["ImageUrl"].stringValue)
                                 
                                   
                                 }
                                
                                self.memberListTableView.reloadData()
                                self.removeSpinner()
                             }
                         }
                             
                             
                         
                 }
                     else{
                         print("get members Error\(String(describing: response.result.error))")
                                        self.showToast(message : "Connection Issues", color: UIColor.gray)
                     }
                 }
             }
    // MARK:- Table view Methods
    func tableDelegateMethods(){

           //assign table view delegates
            memberListTableView.dataSource = self
            memberListTableView.delegate = self
        
            memberListTableView.register(UINib(nibName: "MemberListCell", bundle: nil), forCellReuseIdentifier: "memberListCell")
            configureCells()
    }
    func configureCells(){
        memberListTableView.rowHeight = 120.0
        memberListTableView.estimatedRowHeight = 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberListTableView.dequeueReusableCell(withIdentifier: "memberListCell", for: indexPath) as! MemberListCell
        cell.comanyNameLabel.text = companyList[indexPath.row]
        cell.categoryNameLabel.text = categoryList[indexPath.row]
        cell.phoneNumberLabel.text = phoneNoList[indexPath.row]
        cell.nameLabel.text = memberNameList[indexPath.row]
        cell.userProfileImage.load(imageUrl: imageUrlList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.numberOfItems == 0{
           // self.memberListTableView.isHidden = true
            return 0
        }
        else{
            return self.numberOfItems
        }
    }
}
