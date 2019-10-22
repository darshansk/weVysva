//
//  MyLinksViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/22/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class MyLinksViewController: UIViewController {

    @IBOutlet weak var startDateTextField: UITextField!
    private var datePicker: UIDatePicker?
    @objc func dateChanged(datePickerInput: UIDatePicker){
          let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd/MM/yyyy"
           
           startDateTextField.text = dateFormatter.string(from: datePickerInput.date)
           view.endEditing(true)
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        startDateTextField.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(MyLinksViewController.dateChanged(datePickerInput: datePicker!)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
