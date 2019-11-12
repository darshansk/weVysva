//
//  ViewVisitorsViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/31/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class ViewVisitorsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBAction func viewVisitorsButtonClicked(_ sender: Any) {
    }
    @IBOutlet weak var viewVisitorsTableView: UITableView!
     private var startdatePicker: UIDatePicker!
            private var enddatePicker: UIDatePicker!
            override func viewDidLoad() {
                super.viewDidLoad()

                viewVisitorsTableView.delegate = self
                viewVisitorsTableView.dataSource = self
                
                datePickers()
                
                configureCell()
                viewVisitorsTableView.register(UINib(nibName: "ViewDetailsCell", bundle: nil), forCellReuseIdentifier: "viewDetailsCell")
            }
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 8
            }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = viewVisitorsTableView.dequeueReusableCell(withIdentifier: "viewDetailsCell", for: indexPath) as! ViewDetailsCell
                return cell
            }

            func configureCell(){
                viewVisitorsTableView.rowHeight = 30.0
                viewVisitorsTableView.estimatedRowHeight = 30.0
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
