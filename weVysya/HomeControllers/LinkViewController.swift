//
//  LinkViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/22/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import iOSDropDown
import Alamofire
import SwiftyJSON
class LinkViewController: UIViewController,UITextFieldDelegate  {
   
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var notesTextFeild: UITextField!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var contactNumberTextFeild: UITextField!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var contactPersonTextField: UITextField!
    @IBOutlet weak var contactPersonNameLabel: UILabel!
    @IBOutlet weak var selectHouseButton: UIButton!
    @IBOutlet weak var linkTextField: DropDown!
    @IBOutlet weak var contactPersonLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var selectHouseMemberTextField: DropDown!
    let url = URL(string: "https://quickworkz.com/wv/controller/memberlist.php?type=HubWiseMemberList")!
    var numberOfMembers: Int = 0
    var contactFlag: Bool = false
    var memberNameList: [String] = []
    var selectedLink: String = ""
    var linkFlag = false
    var selectedMemeberId: String = ""
    var selectedMemberName: String = ""
    var responseJSON: JSON!
    var selectedHouse: String = "Select House"
    var memberFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMembers()
        keyboardToggle()
        textfieldHelpers()
        
    }
    
    //MARK:- View Methods
    //Validation Checks
    func textfieldHelpers(){
                linkTextField.delegate=self
                selectHouseMemberTextField.delegate = self
                self.contactPersonNameLabel.isEnabled = false
                self.contactPersonTextField.isEnabled = false
                self.contactNumberLabel.isEnabled =  false
                self.contactNumberTextFeild.isEnabled = false
                 contactNumberTextFeild.keyboardType = .numberPad
                linkTextField.optionArray = ["Self", "Outside"]
       
                
              
                linkTextField.didSelect { (selectedText, index, int) in
                    self.selectedLink = selectedText
                    self.linkFlag = true
                    print("Selected Link :(\(selectedText)) and the flag is set to (\(self.linkFlag))")
                 
                 if selectedText == "Self"{
                     
                  self.contactPersonNameLabel.isEnabled = false
                  self.contactPersonTextField.isEnabled = false
                  self.contactNumberLabel.isEnabled =  false
                  self.contactNumberTextFeild.isEnabled = false
                
                     
                    }
                    else{
                    self.contactFlag = true
                        self.contactPersonNameLabel.isEnabled = true
                        self.contactPersonTextField.isEnabled = true
                        self.contactNumberLabel.isEnabled =  true
                        self.contactNumberTextFeild.isEnabled = true
                    }
                }
         
         
       
         selectHouseMemberTextField.didSelect { (selectedText, index, int) in
             self.selectedMemberName = selectedText
             self.selectedMemeberId  = self.responseJSON[index]["MembershipId"].stringValue
            self.memberFlag = true
            print("selected member:(\(selectedText)) and flag is set to (\(self.memberFlag))")
             
         }

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
    }
    
   @IBAction func submitButtonClicked(_ sender: Any) {
    var flag: Bool = false
    if contactFlag == true{
        if  contactNumberTextFeild.text == "" || contactNumberTextFeild.text == ""{
             self.showToast(message : "Enter Contact Details", color: UIColor.gray)
        }
        else{
            flag = true
        }
    }
    else{
        flag = true
    }
    if stateFlag == true && memberFlag == true && linkFlag == true && notesTextFeild.text != "" && flag == true{
        submitData()
    }
    else if stateFlag == false{
        self.showToast(message : " Please select state", color: UIColor.gray)
    }
    else if memberFlag == false{
        self.showToast(message : " Please select member", color: UIColor.gray)
    }
    else if linkFlag == false{
          self.showToast(message : " Please select link", color: UIColor.gray)
      }
   }
    
    
    
   //MARK: Model Networking functions
    //Networking for MemberList
    
    func getMembers(){
        let parameters: [String: String] = [
            "token": UserDefaults.standard.string(forKey: "token")!]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
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
                            self.memberFlag = true
                            
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
   //Submit Data to server
   func submitData(){
          let url = URL(string: "https://quickworkz.com/wv/controller/links.php?type=links")!
          let parameters: [String: String] = [
              "token" : UserDefaults.standard.string(forKey: "token")!,
              "datetime" : self.systemDate(),
              "fromMem": UserDefaults.standard.string(forKey: "membershipId")!,
              "toMem": self.selectedMemeberId,
              "connect": self.selectedLink,
              "contactPersonName":self.contactPersonTextField.text ?? "",
              "contactPersonPhoneNumber": self.contactNumberTextFeild.text ?? "",
              "notes": self.notesTextFeild.text ?? ""
          ]
          print(parameters)
          Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
              if response.result.isSuccess{
                  let responseJSON: JSON  = JSON(response.result.value!)
                  if responseJSON["Data"] == "Request Successful"{
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
