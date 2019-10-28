//
//  ViewController.swift
//  weVysya
//
//  Created by Deekshith Ms on 14/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class LogInViewController: UIViewController {

 
    @IBOutlet weak var userNameTextField: DTextField!
    @IBOutlet weak var passwordTextField: DTextField!
    @IBOutlet weak var loginInButton: DButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        directSignIn()
        setUpUI()
    keyboardToggle()
        // Do any additional setup after loading the view, typically from a nib. 34 39 79
    }
    func setUpUI(){
        view.backgroundColor = UIColor.rgb(red: 34, green: 39, blue: 79)
        userNameTextField.placeholder = "UserName"
        passwordTextField.placeholder = "Password"
        loginInButton.setTitle("Login", for: .normal)
    }
   
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        signInUser()
           
    }

    func directSignIn(){
          if UserDefaults.standard.bool(forKey: "isUserLoggedIn") == true
          {
              DispatchQueue.main.async(){
                  self.performSegue(withIdentifier: "homePageSegue", sender: self)
              }
          }
      }
    //MARK:- Networking
    
    func signInUser(){
        if userNameTextField.text == "" || passwordTextField.text == "" {
            self.showToast(message: "Enter Login Details", color: UIColor.gray)
        }
        else{
            self.showSpinner(onView: self.view)
            let url = URL(string: "https://quickworkz.com/wv/controller/login.php")
            let parameters: [String: String] = [
                "email": userNameTextField.text!,
                "password": passwordTextField.text!,
                "Phone Number": "",
                "Device ID": ""
            ]
            
            Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
                if response.result.isSuccess == true {
                    self.removeSpinner()
                    let responseJSON: JSON = JSON(response.result.value!)
                      DispatchQueue.main.async(){
                        self.updateUserData(json: responseJSON)
                    }
                     if responseJSON["flag"] == "1" {
                       UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        self.performSegue(withIdentifier: "homePageSegue", sender: self)
                         print(responseJSON)
                        
                     }
                    else{
                        self.showToast(message : " Wrong Credentials", color: UIColor.gray)
                    }
                }
                else{
                                       print("SignInError \(String(describing: response.result.error))")
                                                      self.showToast(message : "Connection Issues", color: UIColor.gray)
                                }
                
            
          
        }
    
        
    }
    
}
    
    func updateUserData(json: JSON){
        
        
         
        let loggedInUser = User.init(age: json["Age"].intValue, isRenewed: json["IsRenewed"].boolValue, isAllowedToAddandViewAttendance: json["IsAllowedToAddandViewAttendance"].boolValue, hubId: json["HubId"].intValue, email: json["Email"].stringValue, anniversaryDate: json["AnniversaryDate"].stringValue, companyName: json["CompanyName"].stringValue, isAllowAllPersmission: json["IsAllowAllPersmission"].boolValue, gender: json["Gender"].stringValue, isAllowedToAddMeetingDates: json["IsAllowedToAddMeetingDates"].boolValue, isAllowedtoViewCnT: json["IsAllowedtoViewCnT"].boolValue, website: json["Website"].stringValue, memberName: json["MemberName"].stringValue, recieptUrl: json["RecieptUrl"].stringValue, isAllowedToViewEventReport: json["IsAllowedToViewEventReport"].boolValue, spouseNumber: json["SpouseNumber"].intValue, visitingCardFront: json["VisitingCardFront"].stringValue, address: json["Address"].stringValue, isAllowedToAddEvent: json["IsAllowedToAddEvent"].boolValue, gothra: json["Gothra"].stringValue, facebookPage: json["FacebookPage"].stringValue, id: json["Id"].intValue, adharNumber: json["AdharNumber"].intValue, hubName: json["HubName"].stringValue, token: json["Token"].stringValue, dob: json["Dob"].stringValue, category: json["Category"].stringValue, membershipId: json["MembershipId"].stringValue, isNewMember: json["IsNewMember"].boolValue, visitingCardBack: json["VisitingCardBack"].stringValue, bloodGroup: json["BloodGroup"].stringValue, flag: json["Flag"].intValue, isAllowedToRegisterVisitor: json["IsAllowedToRegisterVisitor"].boolValue, photoURL: json["PhotoURL"].stringValue, phoneNumber: json["PhoneNumber"].stringValue)
         
     }

}
