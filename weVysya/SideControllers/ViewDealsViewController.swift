//
//  ViewDealsViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class ViewDealsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var viewDealsTableView: UITableView!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var startDate: UITextField!
     private var startdatePicker: UIDatePicker!
       private var enddatePicker: UIDatePicker!
       override func viewDidLoad() {
           super.viewDidLoad()

           viewDealsTableView.delegate = self
           viewDealsTableView.dataSource = self
           
           datePickers()
           
           configureCell()
           viewDealsTableView.register(UINib(nibName: "ViewDetailsCell", bundle: nil), forCellReuseIdentifier: "viewDetailsCell")
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 8
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = viewDealsTableView.dequeueReusableCell(withIdentifier: "viewDetailsCell", for: indexPath) as! ViewDetailsCell
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
