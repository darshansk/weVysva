//
//  DealViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 11/6/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import iOSDropDown
import Alamofire
import SwiftyJSON
class DealViewController: UIViewController {

    @IBOutlet weak var selectHouseButton: UIButton!
     @IBOutlet weak var selectHouseMemberTextField: DropDown!
        @IBOutlet weak var dealTextField: DropDown!

    @IBOutlet weak var contactPersonNumberTextField: UITextField!
    @IBOutlet weak var contactPhoneNoLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
     @IBOutlet weak var AmountTextFeild: UITextField!
     @IBOutlet weak var AmountLabel: UILabel!
     @IBOutlet weak var contactPersonTextField: UITextField!
     @IBOutlet weak var contactPersonNameLabel: UILabel!
    @IBOutlet weak var notesTextFeild: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    let memberurl = URL(string: "https://quickworkz.com/wv/controller/memberlist.php?type=HubWiseMemberList")!
    var numberOfMembers: Int = 0
     var memberNameList: [String] = []
     var selectedLink: String = ""
     var selectedMemeberId: String = ""
     var selectedMemberName: String = ""
    var responseJSON: JSON!
    override func viewDidLoad() {
        super.viewDidLoad()

        getMembers()
         DropDown()
    }
      //MARK:- View Methods
    @IBAction func submitButtonClicked(_ sender: Any) {
       submitData()
    }
    func DropDown(){
      dealTextField.optionArray = ["Self Deal", "Outside Deal"]
  
      self.contactPersonNameLabel.isEnabled = false
      self.contactPersonTextField.isEnabled = false
      self.contactPhoneNoLabel.isEnabled =  false
      self.contactPersonNumberTextField.isEnabled = false
    
      dealTextField.didSelect { (selectedText, index, int) in
       print(selectedText)
       self.selectedLink = selectedText
       if selectedText == "Self Deal"{
           
        self.contactPersonNameLabel.isEnabled = false
        self.contactPersonTextField.isEnabled = false
        self.contactPhoneNoLabel.isEnabled =  false
        self.contactPersonNumberTextField.isEnabled = false
      
           
          }
          else{
         
              self.contactPersonNameLabel.isEnabled = true
              self.contactPersonTextField.isEnabled = true
              self.contactPhoneNoLabel.isEnabled =  true
              self.contactPersonNumberTextField.isEnabled = true
          }
      }
    }
    //Networking for MemberList
       
       func getMembers(){
           let parameters: [String: String] = [
               "token": UserDefaults.standard.string(forKey: "token")!]
           Alamofire.request(memberurl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
               if response.result.isSuccess{
                   self.responseJSON = JSON(response.result.value!)
                   
                   let count = self.responseJSON["Hubwisememberlistdetails"].count
                   print("count \(count)")
                   for i in count{
                      
                       if selectedAppHouse == self.responseJSON["Hubwisememberlistdetails"][i]["HubName"].stringValue{
                           self.responseJSON = self.responseJSON["Hubwisememberlistdetails"][i]["memlist"]
                           
                           self.numberOfMembers = self.responseJSON.count
                       
                           for i in self.numberOfMembers{
                               self.memberNameList.append(self.responseJSON[i]["MemberName"].stringValue)
                               self.selectHouseMemberTextField.optionArray = self.memberNameList
                               
                               
                           }
                       }
                   }
                       
                       
                   
           }
               else{
                   print("get members Error\(String(describing: response.result.error))")
                                  self.showToast(message : "Connection Issues", color: UIColor.gray)
               }
           }
       }
//Submission of the form
    func submitData(){
        let url = URL(string: "https://quickworkz.com/wv/controller/deal.php?type=deal")!
               let parameters: [String: String] = [
                   "token" : UserDefaults.standard.string(forKey: "token")!,
                   "date" : self.systemDate(),
                   "businessFrom": UserDefaults.standard.string(forKey: "memberId")!,
                   "businessTo": self.selectedMemeberId,
                   "connect": self.selectedLink,
                   "connectToPersonName":self.contactPersonTextField.text ?? "",
                   "connectToPersonPhone": self.contactPersonNumberTextField.text ?? "",
                   "notes": self.notesTextFeild.text ?? ""
               ]
               print(parameters)
               Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
                   if response.result.isSuccess{
                       let responseJSON: JSON  = JSON(response.result.value!)
                       if responseJSON["flag"] == "1"{
                           print("sucess")
                           self.showToast(message : "Request Successful", color: UIColor.gray)
                           self.performSegue(withIdentifier: "homePageSegue", sender: self)
                       }
                       else{
                           self.showToast(message : "Request Unsuccessful", color: UIColor.gray)
                       }
                   }
                   else{
                      print("Connection Issues\(String(describing:response.result.error))")
                       self.showToast(message : "Connection Issues", color: UIColor.gray)
                   }
               }
    }


}
