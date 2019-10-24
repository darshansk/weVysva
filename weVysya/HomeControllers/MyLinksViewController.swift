//
//  MyLinksViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/22/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class MyLinksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var linksTableView: UITableView!
    
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
private var startdatePicker: UIDatePicker?
 private var enddatePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickers()
    //Add delegate methods to table view
        linksTableView.delegate = self
        linksTableView.dataSource = self
    //Registering the nib file
        linksTableView.register(UINib(nibName: "DetailsCard", bundle: nil), forCellReuseIdentifier: "detailsCardCell")
        configureTableView()
    }
    
    
    
    //MARK:- Table View Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCardCell", for: indexPath) as! DetailsCard
        
        //let messageArray = [ "one", "two"]
        //cell.messafebody = messageArry[indexPath]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func configureTableView(){
       // linksTableView.rowHeight = UITableViewAutmaticDimension
        linksTableView.estimatedRowHeight = 120.0
         
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
        enddatePicker?.addTarget(self, action: #selector(MyLinksViewController.dateChanged(datePickerInput:)), for: .valueChanged)
            startdatePicker?.addTarget(self, action: #selector(MyLinksViewController.dateChanged(datePickerInput:)), for: .valueChanged)
        //tap Gesture
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecongnizer:)))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func viewTapped(gestureRecongnizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func dateChanged(datePickerInput: UIDatePicker){
             let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "dd/MM/yyyy"
              startDateTextField.text = dateFormatter.string(from: datePickerInput.date)
              //view.endEditing(true)
          }
   

}
