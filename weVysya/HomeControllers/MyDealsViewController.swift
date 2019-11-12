//
//  MyDealsViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyDealsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var receivedToggle: UISwitch!
    @IBOutlet weak var sentToggle: UISwitch!
    @IBOutlet weak var myDealsTableView: UITableView!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    private var numberOfItems: Int = 0
    private var membersName: [String] = []
    private var memberAmount: [String] = []
    private var memberPhoneno: [String] = []
      private var memeberDeal: [String] = []
      private var membernotes: [String] = []
        let url = URL(string: "https://quickworkz.com/wv/controller/deal.php?type=mydeal")
    private var startdatePicker: UIDatePicker?
    private var enddatePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickers()
               
           //Add delegate methods to table view
               myDealsTableView.delegate = self
               myDealsTableView.dataSource = self
               
           //Registering the nib file
               myDealsTableView.register(UINib(nibName: "DealsCell", bundle: nil), forCellReuseIdentifier: "myDealsCell")
               configureTableView()
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        if sentToggle.isOn && receivedToggle.isOn {
                    loadData()
              
                 
                   
               }
               else if sentToggle.isOn && receivedToggle.isOn == false{
                    loadData(toggle: "senttransaction")
               }
               else if sentToggle.isOn == false && receivedToggle.isOn {
                    loadData(toggle: "recievedtransaction")
               }
        else if sentToggle.isOn == false && receivedToggle.isOn == false{
            numberOfItems = 0
            myDealsTableView.reloadData()
        }
    }
    //Get Data
    func loadData(toggle: String){
        let parameters: [String: String] = [
        "token": UserDefaults.standard.string(forKey: "token")!,
        "HubId": UserDefaults.standard.string(forKey: "hubId")!,
        "FromDate": startDateTextField.text!,
        "ToDate": endDateTextField.text!,   ];
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                        let responseJSON: JSON = JSON(response.result.value!)
                print(responseJSON)
                //only reiceved in done
                self.numberOfItems = responseJSON["Data"][toggle].count
                print(self.numberOfItems)
                for i in self.numberOfItems {
                    self.membersName.append(responseJSON["Data"][toggle][i]["FromMemberName"].stringValue)
                    self.memberAmount.append(responseJSON["Data"][toggle][i]["TransactionValue"].stringValue)
                   self.memberPhoneno.append(responseJSON["Data"][toggle][i]["FromMemberPhone"].stringValue)
                   self.memeberDeal.append(responseJSON["Data"][toggle][i]["Connect"].stringValue)
                   self.membernotes.append(responseJSON["Data"][toggle][i]["Notes"].stringValue)
                }
                print(self.membersName)
                print(self.memberAmount)
                print(self.memberPhoneno)
                print(self.memeberDeal)
               print(self.membernotes)
                
                self.myDealsTableView.reloadData()
                self.removeSpinner()
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
                print(responseJSON)
                let sentNo = responseJSON["Data"]["senttransaction"].count
                let recievedNo = responseJSON["Data"]["recievedtransaction"].count
                self.numberOfItems = sentNo + recievedNo
                
                print(self.numberOfItems)
                for i in sentNo {
                    self.membersName.append(responseJSON["Data"]["senttransaction"][i]["FromMemberName"].stringValue)
                    self.memberAmount.append(responseJSON["Data"]["senttransaction"][i]["TransactionValue"].stringValue)
                   self.memberPhoneno.append(responseJSON["Data"]["senttransaction"][i]["FromMemberPhoneNo"].stringValue)
                   self.memeberDeal.append(responseJSON["Data"]["senttransaction"][i]["Connect"].stringValue)
                   self.membernotes.append(responseJSON["Data"]["senttransaction"][i]["Notes"].stringValue)
                }
                for i in recievedNo {
                    self.membersName.append(responseJSON["Data"]["recievedtransaction"][i]["FromMemberName"].stringValue)
                    self.memberAmount.append(responseJSON["Data"]["recievedtransaction"][i]["TransactionValue"].stringValue)
                   self.memberPhoneno.append(responseJSON["Data"]["recievedtransaction"][i]["FromMemberPhoneNo"].stringValue)
                   self.memeberDeal.append(responseJSON["Data"]["recievedtransaction"][i]["Connect"].stringValue)
                   self.membernotes.append(responseJSON["Data"]["recievedtransaction"][i]["Notes"].stringValue)
                }
                print(self.membersName)
                print(self.memberAmount)
                print(self.memberPhoneno)
                print(self.memeberDeal)
               print(self.membernotes)
                
                self.myDealsTableView.reloadData()
                self.removeSpinner()
            }
                    
                    
                       
                
                        
            
            else{
                print("ViewLinks Error\(String(describing: response.result.error))")
                self.showToast(message : "Connection Issues", color: UIColor.gray)
            }
        }
    }
    //MARK:- Table View Methods
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "myDealsCell", for: indexPath) as! DealsCell
        cell.fromMemberTextField.text = self.membersName[indexPath.row]
              cell.amountTextField.text = self.memberAmount[indexPath.row]
              cell.dealTextField.text = self.memeberDeal[indexPath.row]
         cell.phoneTextField.text = self.memberPhoneno[indexPath.row]
        cell.notesTextField.text = self.membernotes[indexPath.row]
             
         return cell
     }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return numberOfItems
     }
     func configureTableView(){
         myDealsTableView.rowHeight = 200.0
         myDealsTableView.estimatedRowHeight = 200.0
          
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
