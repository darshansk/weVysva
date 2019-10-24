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

}
