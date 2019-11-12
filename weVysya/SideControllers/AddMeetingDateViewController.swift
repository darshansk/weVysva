//
//  AddMeetingDateViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class AddMeetingDateViewController: UIViewController {

   
    @IBOutlet weak var submitButtonClicked: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var selectHouseButton: UIButton!
    @IBOutlet weak var meetingDateTextField: UITextField!
    private var calenderPicker: UIDatePicker!
    let url = URL(string: "https://quickworkz.com/wv/controller/meeting.php?type=addMeetingDates")
    override func viewDidLoad() {
        super.viewDidLoad()

        datetPickers()
    }
    
    @IBAction func submitButtonIsClicked(_ sender: Any) {
         
        loadData()
        
       }
    //MARK:- Networking
    func loadData(){
        let parameters: [String: String] = [
            "token" : UserDefaults.standard.string(forKey: "token")!,
            "startDate": systemDate(),
            "meetingDate": self.meetingDateTextField.text ?? "",
            "location":self.locationTextField.text ?? "",
            "hubId": UserDefaults.standard.string(forKey: "hubId")!
            
        ]
        Alamofire.request(self.url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess{
                let responseJSON: JSON = JSON(response.result.value!)
                if responseJSON["flag"] == "1"{
                    self.showToast(message: "Sucess!", color: UIColor.green, textColor: UIColor.white)
                    self.selectHouseButton.titleLabel?.text = "Select House"
                    self.meetingDateTextField.text = ""
                    self.subjectTextField.text = ""
                    self.locationTextField.text = ""
                }
                else{
                     self.showToast(message: "Try Again", color: UIColor.gray)
                }
            }
            else{
                print("add meeting\(String(describing:response.result.error))")
                self.showToast(message : "Connection Issues", color: UIColor.gray)
                        
            }
        }
    }
    
    //MARK:-DatePicker
    func datetPickers(){
              //initialization
              calenderPicker = UIDatePicker()
        calenderPicker?.datePickerMode = .date
              
             
              
              //assign to input field
              meetingDateTextField.inputView = calenderPicker
            
              
               calenderPicker?.addTarget(self, action: #selector(AddMeetingDateViewController.startdateChanged(datePickerInput:)), for: .valueChanged)
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
