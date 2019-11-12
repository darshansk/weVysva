//
//  MyLinksViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/22/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MyLinksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    
    
    @IBOutlet weak var receivedToggle: UISwitch!
    @IBOutlet weak var sentToggle: UISwitch!
    @IBOutlet weak var linksTableView: UITableView!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    private var startdatePicker: UIDatePicker?
    private var enddatePicker: UIDatePicker?
    private var numberOfItems: Int = 0
    private var membersName: [String] = []
    private var memberTotalDate: [String] = []
    private var memberPhoneno: [String] = []
      private var memeberlink: [String] = []
      private var membernotes: [String] = []
    let url = URL(string: "https://quickworkz.com/wv/controller/links.php?type=mylinks")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickers()
        
        
        
        viewElements()
    }
    
    
    //MARK:- view Controls
    func viewElements(){
        startDateTextField.delegate = self
        endDateTextField.delegate = self
        //Add delegate methods to table view
            linksTableView.delegate = self
            linksTableView.dataSource = self
            
        //Registering the nib file
            linksTableView.register(UINib(nibName: "LinksCard", bundle: nil), forCellReuseIdentifier: "linksCardCell")
            configureTableView()
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField == startDateTextField, let textFieldString = textField.text as NSString? else {
            return true
        }
        guard textField == endDateTextField, let endtextFieldString = textField.text as NSString? else {
            return true
        }
        let newString = textFieldString.replacingCharacters(in: range, with: string)
        let endString = endtextFieldString.replacingCharacters(in: range, with: string)
        let expression = "^([0-9]+)?([\\,\\.]([0-9]{1,2})?)?$"

        let regex = try? NSRegularExpression(pattern: expression, options: .caseInsensitive)
        let numberOfMathces = regex?.numberOfMatches(in: newString, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, newString.count))

        let endnumberOfMathces = regex?.numberOfMatches(in: endString, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, endString.count))
        if endnumberOfMathces == 0 {
            return false
        }
        if numberOfMathces == 0 {
            return false
        }

        return true
    }
    @IBAction func filterButtonClicked(_ sender: Any) {
      
        if sentToggle.isOn && receivedToggle.isOn {
             loadData()
        }
        else if sentToggle.isOn && receivedToggle.isOn == false{
             loadData(toggle: "sent")
        }
        else if sentToggle.isOn == false && receivedToggle.isOn {
             loadData(toggle: "recieved")
        }
        else if sentToggle.isOn == false && receivedToggle.isOn == false{
                   numberOfItems = 0
            linksTableView.reloadData()
               }
       }
    
    
    
    //MARK:- Networking functions
    func loadData(toggle: String){
        let parameters: [String: String] = [
        "token": UserDefaults.standard.string(forKey: "token")!,
        "HubId": UserDefaults.standard.string(forKey: "hubId")!,
        "FromDate": startDateTextField.text!,
        "ToDate": endDateTextField.text!,   ];
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                        let responseJSON: JSON = JSON(response.result.value!)
                if responseJSON["flag"] == "1"{
                print("Data for :(\(toggle)) is (\(responseJSON["Data"][toggle]))")
                 
                self.numberOfItems = responseJSON["Data"][toggle].count
                    if self.numberOfItems != 0{
                
                for i in self.numberOfItems {
                    self.membersName.append(responseJSON["Data"][toggle][i]["FromMemberName"].stringValue)
                    self.memberTotalDate.append(responseJSON["Data"][toggle][i]["connectDate"].stringValue)
                   self.memberPhoneno.append(responseJSON["Data"][toggle][i]["FromMemberPhoneNo"].stringValue)
                   self.memeberlink.append(responseJSON["Data"][toggle][i]["connect"].stringValue)
                   self.membernotes.append(responseJSON["Data"][toggle][i]["notes"].stringValue)
                }
                
                
                self.linksTableView.reloadData()
                self.removeSpinner()
           
                    }
                    else{
                        self.showToast(message : "No Links Avaiable", color: UIColor.gray)
                    }
                
                }
                
                else{
                    self.showToast(message : "Session Expired", color: UIColor.gray)
                }
                
                }
                    
                    
                       
                
                        
            
            else{
                print("ViewLinks Error\(String(describing: response.result.error))")
                self.showToast(message : "Connection Issues", color: UIColor.gray)
            }
        }
    }
    func loadData(){
        let parameters: [String: String] = [
        "token": UserDefaults.standard.string(forKey: "token")!,
        "HubId": UserDefaults.standard.string(forKey: "hubId")!,
        "FromDate": startDateTextField.text!,
        "ToDate": endDateTextField.text!,   ];
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                        let responseJSON: JSON = JSON(response.result.value!)
                if responseJSON["flag"] == "1"{
                      print("Data  is (\(responseJSON["Data"]))")
                let sentNo = responseJSON["Data"]["sent"].count
                let recievedNo = responseJSON["Data"]["recieved"].count
                self.numberOfItems = sentNo + recievedNo
                
                    if self.numberOfItems != 0{
                for i in sentNo {
                    self.membersName.append(responseJSON["Data"]["sent"][i]["FromMemberName"].stringValue)
                    self.memberTotalDate.append(responseJSON["Data"]["sent"][i]["connectDate"].stringValue)
                   self.memberPhoneno.append(responseJSON["Data"]["sent"][i]["FromMemberPhoneNo"].stringValue)
                   self.memeberlink.append(responseJSON["Data"]["sent"][i]["connect"].stringValue)
                   self.membernotes.append(responseJSON["Data"]["sent"][i]["notes"].stringValue)
                }
                for i in recievedNo {
                    self.membersName.append(responseJSON["Data"]["recieved"][i]["FromMemberName"].stringValue)
                    self.memberTotalDate.append(responseJSON["Data"]["recieved"][i]["connectDate"].stringValue)
                   self.memberPhoneno.append(responseJSON["Data"]["recieved"][i]["FromMemberPhoneNo"].stringValue)
                   self.memeberlink.append(responseJSON["Data"]["recieved"][i]["connect"].stringValue)
                   self.membernotes.append(responseJSON["Data"]["recieved"][i]["notes"].stringValue)
                }
             
                
                self.linksTableView.reloadData()
                self.removeSpinner()
                    }
                    else{
                        self.showToast(message : "No Links Avaiable", color: UIColor.gray)
                    }
                }
                else{
                    self.showToast(message : "Session Expired", color: UIColor.gray)
                }
            }
                    
            
            else{
                print(" my Links Error\(String(describing: response.result.error))")
                self.showToast(message : "Connection Issues", color: UIColor.gray)
            }
        }
    }
    //MARK:- Table View Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "linksCardCell", for: indexPath) as! LinksCard
        cell.memberTextField.text = self.membersName[indexPath.row]
        cell.linkTextField.text = self.memeberlink[indexPath.row]
        cell.dateTextField.text = self.memberTotalDate[indexPath.row]
        cell.notesTextField.text = self.membernotes[indexPath.row]
        cell.phoneTextField.text = self.memberPhoneno[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }
    func configureTableView(){
        linksTableView.rowHeight = 200.0
        linksTableView.estimatedRowHeight = 200.0
         
    }
    
   
    //MARK:- Date Picker
    func datePickers(){
        //initialization
        startdatePicker = UIDatePicker()
        startdatePicker?.datePickerMode = .date
        
        enddatePicker = UIDatePicker()
        enddatePicker?.datePickerMode = .date
        
        //assign to input field
        startDateTextField.inputView = startdatePicker
        endDateTextField.inputView = enddatePicker
        
        //end state handling
        enddatePicker?.addTarget(self, action: #selector(MyLinksViewController.enddateChanged(datePickerInput:)), for: .valueChanged)
        startdatePicker?.addTarget(self, action: #selector(MyLinksViewController.startdateChanged(datePickerInput:)), for: .valueChanged)
        //tap Gesture
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecongnizer:)))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func viewTapped(gestureRecongnizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func startdateChanged(datePickerInput: UIDatePicker){
             let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "dd/MM/yyyy"
              startDateTextField.text = dateFormatter.string(from: datePickerInput.date)
        
              //view.endEditing(true)
          }
    @objc func enddateChanged(datePickerInput: UIDatePicker){
         let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd/MM/yyyy"
          endDateTextField.text = dateFormatter.string(from: datePickerInput.date)
    
          //view.endEditing(true)
      }
   

}
