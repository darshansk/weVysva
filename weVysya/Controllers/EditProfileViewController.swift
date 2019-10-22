//
//  EditProfileViewController.swift
//  weVysya
//
//  Created by Centura on 21/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var memberIdTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var aadharNumberTextField: UITextField!
    @IBOutlet weak var facebookProfileTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var dateOfMarriageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var gothramTextField: UITextField!
    @IBOutlet weak var catagoryTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBAction func updateButtonPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        placeHolderSetUp()
        // Do any additional setup after loading the view.
    }
    func placeHolderSetUp(){
        memberIdTextField.placeholder = "Member ID"
        nameTextField.placeholder = "Name"
        address.placeholder = "Address"
        emailTextField.placeholder = "Email"
        houseTextField.placeholder = "House"
        aadharNumberTextField.placeholder = "Aadhar Number"
        facebookProfileTextField.placeholder = "Facebook Profile"
        dateOfBirthTextField.placeholder = "Date of Birth"
        dateOfMarriageTextField.placeholder = "Date of Marriage"
        genderTextField.placeholder = "Gender"
        gothramTextField.placeholder = " Gothram"
        catagoryTextField.placeholder = "Category"
        phoneTextField.placeholder = "Phone"
        websiteTextField.placeholder = "Website"
    
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
