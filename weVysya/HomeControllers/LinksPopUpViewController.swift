//
//  PopUpViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import iOSDropDown
class LinksPopUpViewController: UIViewController {

    @IBOutlet weak var selectHouseTextField: DropDown!
    @IBOutlet weak var selectZoneTextField: DropDown!
    @IBOutlet weak var selectStateTextField: DropDown!
    @IBOutlet weak var cancelButtonClicked: UIButton!
    
    
    
    
    @IBAction func okButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        selectStateTextField.optionArray = ["Andra Pradesh", "Karnataka", "Tamil Nadu", "Telengana"]
        selectStateTextField.didSelect { (selectedText, index, id) in
            self.selectStateTextField.placeholder = selectedText
        }
          
        
        
        
    }
    



}
