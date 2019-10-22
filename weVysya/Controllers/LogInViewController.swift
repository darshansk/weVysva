//
//  ViewController.swift
//  weVysya
//
//  Created by Deekshith Ms on 14/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

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
           performSegue(withIdentifier: "homePageSegue", sender: self)
    }
}

