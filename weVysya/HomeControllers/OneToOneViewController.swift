//
//  OneToOneViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 11/12/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import iOSDropDown
import Alamofire
import SwiftyJSON
class OneToOneViewController: UIViewController {

    @IBOutlet weak var selectDateTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
   
  
    @IBAction func submitButtonClicked(_ sender: Any) {
        submitData()
    }
    @IBOutlet weak var selectMemberButton: DropDown!
    @IBOutlet weak var selectHouseButton: UIButton!
    
       let memberurl = URL(string: "https://quickworkz.com/wv/controller/memberlist.php?type=HubWiseMemberList")!
     var numberOfMembers: Int = 0
      var memberNameList: [String] = []
      var selectedLink: String = ""
      var selectedMemeberId: String = ""
      var selectedMemberName: String = ""
     var responseJSON: JSON!
    private var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        getMembers()
        
        
        datePickers()
        
        
    }
    
    //Submission of the form
    func submitData(){
        let url = URL(string: "https://quickworkz.com/wv/controller/onetoone.php?type=SendOneToOne")!
               let parameters: [String: String] = [
                   "token" : UserDefaults.standard.string(forKey: "token")!,
                   
                   "fromMemberId": UserDefaults.standard.string(forKey: "membershipId")!,
                   "toMemberId": self.selectedMemeberId,
                   "date": self.selectDateTextField.text!,
                "notes": self.notesTextField.text!
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

    
    //Networking for MemberList
          
          func getMembers(){
              let parameters: [String: String] = [
                  "token": UserDefaults.standard.string(forKey: "token")!]
              Alamofire.request(memberurl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
                  if response.result.isSuccess{
                      self.responseJSON = JSON(response.result.value!)
                    print("The response is \(self.responseJSON.stringValue)")
                      let count = self.responseJSON["Hubwisememberlistdetails"].count
                      print("count \(count)")
                      for i in count{
                         
                          if selectedAppHouse == self.responseJSON["Hubwisememberlistdetails"][i]["HubName"].stringValue{
                              self.responseJSON = self.responseJSON["Hubwisememberlistdetails"][i]["memlist"]
                              
                              self.numberOfMembers = self.responseJSON.count
                          
                              for i in self.numberOfMembers{
                                  self.memberNameList.append(self.responseJSON[i]["MemberName"].stringValue)
                                  self.selectMemberButton.optionArray = self.memberNameList
                                self.selectMemberButton.didSelect { (selectedText, index, int) in
                                    self.selectMemberButton.text = selectedText
                                   self.selectedMemeberId  = self.responseJSON[index]["MembershipId"].stringValue                                }
                              
                                
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
    //MARK:- Date Picker
    func datePickers(){
        //initialization
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        
        //assign to input field
        selectDateTextField.inputView = datePicker
       
        
        //end state handling
        
        datePicker?.addTarget(self, action: #selector(OneToOneViewController.dateChanged(datePickerInput:)), for: .valueChanged)
        //tap Gesture
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecongnizer:)))
            selectDateTextField.addGestureRecognizer(tapGesture)
    }
    @objc func viewTapped(gestureRecongnizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func dateChanged(datePickerInput: UIDatePicker){
             let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "yyyy/MM/dd"
              selectDateTextField.text = dateFormatter.string(from: datePickerInput.date)
        
             // view.endEditing(true)
          }
   
}
