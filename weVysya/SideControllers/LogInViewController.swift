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

                     if responseJSON["flag"] == "1" {
                       UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                          DispatchQueue.main.async(){
                            self.updateUserData(json: responseJSON)
                        }
                        self.performSegue(withIdentifier: "homePageSegue", sender: self)
                         print(responseJSON)
                        
                     }
                    else{
                        self.removeSpinner()
                        self.showToast(message : " Wrong Credentials", color: UIColor.gray)
                    }
                }
                else{          self.removeSpinner()
                        print("SignInError\(String(describing:response.result.error))")
                        self.showToast(message : "Connection Issues", color: UIColor.gray)
                                }
                
            
          
        }
    
        
    }
    
}
    
    func updateUserData(json: JSON){
       
        UserDefaults.standard.setValue(json["token"].stringValue, forKey: "token")
        UserDefaults.standard.setValue(json["Id"].stringValue, forKey: "id")
        UserDefaults.standard.setValue(json["HubId"].stringValue, forKey: "hubId")
        
        UserDefaults.standard.set(json["PhotoURL"].stringValue, forKey: "memberphotoUrl")
         UserDefaults.standard.setValue(json["MembershipId"].stringValue, forKey: "membershipId")
        UserDefaults.standard.set(json["MemberName"].stringValue, forKey: "memberName")
        UserDefaults.standard.set(json["Address"].stringValue, forKey: "address")
        UserDefaults.standard.set(json["Email"].stringValue, forKey: "email")
        UserDefaults.standard.set(json["PhoneNumber"].stringValue, forKey: "phoneNo")
        UserDefaults.standard.set(json["Category"].stringValue, forKey: "category")
        UserDefaults.standard.set(json["Gothra"].stringValue, forKey: "gothra")
        UserDefaults.standard.set(json["Gender"].stringValue, forKey: "gender")
        UserDefaults.standard.set(json["CompanyName"].stringValue, forKey: "companyName")
        UserDefaults.standard.setValue(json["HubName"].stringValue, forKey: "hubName")
        UserDefaults.standard.set(json["AnniversaryDate"].stringValue, forKey: "dOM")
        UserDefaults.standard.set(json["DOB"].stringValue, forKey: "dOB")
        UserDefaults.standard.set(json["FacebookPage"].stringValue, forKey: "facebook")
        UserDefaults.standard.set(json["AdharNumber"].stringValue, forKey: "adharNumber")
        UserDefaults.standard.set(json["Website"].stringValue, forKey: "website")
        
        
        
         print( UserDefaults.standard.string(forKey: "token")!)
    }



}
