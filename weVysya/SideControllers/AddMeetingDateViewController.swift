//
//  AddMeetingDateViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class AddMeetingDateViewController: UIViewController {

    @IBOutlet weak var meetingDateTextField: UITextField!
    private var calenderPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        datetPickers()
    }
    func datetPickers(){
              //initialization
              calenderPicker = UIDatePicker()
        calenderPicker?.datePickerMode = .date
              
             
              
              //assign to input field
              meetingDateTextField.inputView = calenderPicker
            
              
             
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
                    meetingDateTextField.text = dateFormatter.string(from: datePickerInput.date)
              
                    //view.endEditing(true)
                }
         

}
