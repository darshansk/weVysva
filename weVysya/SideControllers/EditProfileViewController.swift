//
//  EditProfileViewController.swift
//  weVysya
//
//  Created by Centura on 21/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import CoreData
class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
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
     textFieldUpdation()
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

    func textFieldUpdation(){
memberIdTextField.text = UserDefaults.standard.string(forKey: "membershipId")
nameTextField.text = UserDefaults.standard.string(forKey: "memberName")
address.text = UserDefaults.standard.string(forKey: "address")
emailTextField.text = UserDefaults.standard.string(forKey: "email")
houseTextField.text = UserDefaults.standard.string(forKey: "hubName")
aadharNumberTextField.text = UserDefaults.standard.string(forKey: "adharNumber")
facebookProfileTextField.text = UserDefaults.standard.string(forKey: "facebook")
dateOfBirthTextField.text = UserDefaults.standard.string(forKey: "dOB")
dateOfMarriageTextField.text = UserDefaults.standard.string(forKey: "dOM")
genderTextField.text = UserDefaults.standard.string(forKey: "gender")
gothramTextField.text = UserDefaults.standard.string(forKey: "gothra")
catagoryTextField.text = UserDefaults.standard.string(forKey: "category")
phoneTextField.text = UserDefaults.standard.string(forKey: "phoneNo")
websiteTextField.text = UserDefaults.standard.string(forKey: "website")
        userImageView.load(imageUrl: UserDefaults.standard.string(forKey: "memberphotoUrl")!)
    }
    
//MARK:- Networking
    let url: URL = URL(string: "https://quickworkz.com/wv/controller/editprofile.php?type=EditMember")!
    let parameters: [String: String] = [
        "token": UserDefaults.standard.string(forKey: "token")!,
        "id": UserDefaults.standard.string(forKey: "id")!,
        "memberName": UserDefaults.standard.string(forKey: "memberName")!,
        "address": UserDefaults.standard.string(forKey: "address")!,
        "phoneNumber": UserDefaults.standard.string(forKey: "phoneNo")!,
        "email": UserDefaults.standard.string(forKey: "email")!,
        "gender": UserDefaults.standard.string(forKey: "gender")!,
        
       // Off done
        
    ];
    
    
    

}
