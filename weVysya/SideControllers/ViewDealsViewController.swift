//
//  ViewDealsViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewDealsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewDealsTableView: UITableView!
    @IBOutlet weak var endDate: UITextField!
   
    @IBOutlet weak var startDate: UITextField!
     private var startdatePicker: UIDatePicker!
       private var enddatePicker: UIDatePicker!
    private var numberOfItems:  Int = 0
    private var membersName: [String] = []
    private var memberTotalAmount: [String] = []
    let url = URL(string: "https://quickworkz.com/wv/controller/deal.php?type=viewdeal")
       override func viewDidLoad() {
           super.viewDidLoad()

           viewDealsTableView.delegate = self
           viewDealsTableView.dataSource = self
           
           datePickers()
           
           configureCell()
           viewDealsTableView.register(UINib(nibName: "ViewDetailsCell", bundle: nil), forCellReuseIdentifier: "viewDetailsCell")
       }
       
    //MARK:- UI
    func tableViewHidden(bool: Bool){
        nameLabel.isHidden = bool
        amountLabel.isHidden = bool
        viewDealsTableView.isHidden = bool
    }
    //MARK:- Load data
    @IBAction func viewDealButtonClicked(_ sender: Any) {
           if startDate.text == "" || endDate.text == ""{
               showToast(message: "Enter the Dates", color: UIColor.gray, textColor: UIColor.white)
           }
           else{
            self.showSpinner(onView: self.view)
            loadData()
           }
       }
    func loadData(){
        let parameters: [String: String] = [
        "token": UserDefaults.standard.string(forKey: "token")!,
        "HubId": UserDefaults.standard.string(forKey: "hubId")!,
        "FromDate": startDate.text!,
        "ToDate": endDate.text!,   ];
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                let responseJSON: JSON = JSON(response.result.value!)
                if responseJSON["flag"] == "1"{
                self.numberOfItems = responseJSON["data"].count
                
                print("Data for deals is : (\(responseJSON))")
                    if self.numberOfItems != 0{
                for i in self.numberOfItems {
                self.membersName.append(responseJSON["data"][i]["MemberName"].stringValue)
           self.memberTotalAmount.append(responseJSON["data"][i]["totalTransactionValue"].stringValue)
                    
                }
                print(self.membersName)
                print(self.memberTotalAmount)
                self.viewDealsTableView.reloadData()
                self.removeSpinner()
                    }
                    else{
                        self.showToast(message : "No Deals Found", color: UIColor.gray)
                    }
                    
                }
                else{
                    self.showToast(message : "Session Expired", color: UIColor.gray)
                     self.removeSpinner()                }
            }
            else{
                print("ViewLinks Error\(String(describing: response.result.error))")
                self.showToast(message : "Connection Issues", color: UIColor.gray)
                 self.removeSpinner()
                
            }
        }
    }
    
    //tableview methods
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberOfItems == 0{
            tableViewHidden(bool: true)
            return numberOfItems
        }
        else{
            tableViewHidden(bool: false)
           return numberOfItems
        }
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = viewDealsTableView.dequeueReusableCell(withIdentifier: "viewDetailsCell", for: indexPath) as! ViewDetailsCell
        cell.nameLabel.text = membersName[indexPath.row]
        cell.numberLabel.text = memberTotalAmount[indexPath.row]
           return cell
       }

       func configureCell(){
           viewDealsTableView.rowHeight = 30.0
           viewDealsTableView.estimatedRowHeight = 30.0
       }

       //MARK:- Date Picker
       func datePickers(){
           //initialization
           startdatePicker = UIDatePicker()
           startdatePicker?.datePickerMode = .date
           
           enddatePicker = UIDatePicker()
           enddatePicker?.datePickerMode = .date
           
           //assign to input field
           startDate.inputView = startdatePicker
           endDate.inputView = enddatePicker
           
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
                 startDate.text = dateFormatter.string(from: datePickerInput.date)
           
                 //view.endEditing(true)
             }
       @objc func enddateChanged(datePickerInput: UIDatePicker){
            let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "dd/MM/yyyy"
           endDate.text = dateFormatter.string(from: datePickerInput.date)
       
             //view.endEditing(true)
         }

}
