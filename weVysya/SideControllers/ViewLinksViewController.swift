//
//  ViewLinksViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class ViewLinksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var viewLinksTableView: UITableView!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var startDate: UITextField!
    
    private var startdatePicker: UIDatePicker!
    private var enddatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLinksTableView.delegate = self
        viewLinksTableView.dataSource = self
        
        datePickers()
        
        configureCell()
        viewLinksTableView.register(UINib(nibName: "ViewDetailsCell", bundle: nil), forCellReuseIdentifier: "viewDetailsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewLinksTableView.dequeueReusableCell(withIdentifier: "viewDetailsCell", for: indexPath) as! ViewDetailsCell
        return cell
    }

    func configureCell(){
        viewLinksTableView.rowHeight = 30.0
        viewLinksTableView.estimatedRowHeight = 30.0
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
