//
//  OneToOnePopUpViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import iOSDropDown
class OneToOnePopUpViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var selectHouseTextField: DropDown!
    @IBOutlet weak var selectZoneTextField: DropDown!
    @IBOutlet weak var selectStateTextField: DropDown!
    @IBAction func okButtonPressed(_ sender: Any) {
        pageNavigation()
    }
    @IBOutlet weak var okButtonPressed: UIButton!
       private var responseJSON: JSON!
     private var numberOfStates: Int!
     private var selectedState: String = ""
     private var selectedZone: String = ""
     private var selectedHouse: String = ""
     private var stateList: [String] = []
     private var ZoneList: [String] = []
     private var HouseList: [String] = []
     private var url: URL = URL(string: "https://quickworkz.com/wv/controller/memberlist.php?type=HubName")!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        validationChecks()
        
        
    }
    
    //MARK:- View Controls
    
    //Validation Checks
    func validationChecks(){
    okButtonPressed.isEnabled = false
    selectZoneTextField.delegate = self
    selectHouseTextField.delegate = self
    selectStateTextField.delegate = self
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
     
       func pageNavigation(){
           let storyBoard: UIStoryboard = UIStoryboard(name:"OnetoOne", bundle: nil)
           let newViewController = storyBoard.instantiateViewController(withIdentifier:"oneToOneViewController") as! OneToOneViewController
                   
                   newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                   self.present(newViewController, animated: true, completion: { () in
                    
                       newViewController.selectHouseButton.titleLabel?.text = self.selectedHouse
                      
                       
                   })
       }
    
    
    //MARK:- Model Networking Controls
        
        //Load All Data
           func getData(){
               let parameters: [String: String] = [
                      "token": UserDefaults.standard.string(forKey: "token")!,
                       ];
               Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
                   if response.result.isSuccess {
                   
                       self.responseJSON = JSON(response.result.value!)
                       print("Load States Data: \(self.responseJSON!)")
                       self.loadStates()
                    
                      
                   }
                   else {
                       print("State House List Error\(String(describing: response.result.error))")
                               self.showToast(message : "Connection Issues", color: UIColor.gray)
                   }
               }
               
           }

        
        
        //Load SubMenus
        func loadStates(){
                   self.numberOfStates = responseJSON["hubwisememberlistdetails"].count
            for i in self.numberOfStates{
    self.stateList.append(responseJSON["hubwisememberlistdetails"][i]["StateName"].stringValue)
                                      
                                  }
            print("State List Found: \(stateList)")
                   selectStateTextField.optionArray = stateList
                   selectStateTextField.didSelect { (selectedText, index, id) in
                       self.selectStateTextField.placeholder = selectedText
                    self.selectedState = selectedText
                    self.responseJSON = self.responseJSON["hubwisememberlistdetails"][index]
                     self.loadZones()
                   }
               
            
               }
        func loadZones(){
            let numberOfZones = responseJSON["zoneList"].count
            for i in numberOfZones{
                self.ZoneList.append(responseJSON["zoneList"][i]["ZoneName"].stringValue)
                
            }
            print("Zone List Found: \(ZoneList)");       self.selectZoneTextField.optionArray = ZoneList
            selectZoneTextField.didSelect { (selectedText, index, id) in
                self.selectZoneTextField.placeholder = selectedText
                self.selectedZone = selectedText
                self.responseJSON = self.responseJSON["zoneList"][index]
                self.loadHouse()
            }
            
        }
        func loadHouse(){
                let numberOfHouses = responseJSON["houseList"].count
            for i in numberOfHouses{
                self.HouseList.append(responseJSON["houseList"][i]["HouseName"].stringValue)
                
            }
              print("House List Found: \(HouseList)")
            self.selectHouseTextField.optionArray = HouseList
            selectHouseTextField.didSelect { (selectedText, index, id) in
                self.selectHouseTextField.placeholder = selectedText
                self.selectedHouse = selectedText
                
                //Assgin validation Checks
                selectedAppHouse = selectedText
                  stateFlag = true
                print("Selected state is:( \(selectedAppHouse) )and the flag is set to (\(stateFlag))")
                self.okButtonPressed.isEnabled = true
               
            }
        }
       

}
