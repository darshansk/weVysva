//
//  DealsPopUpViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import SwiftyJSON
import iOSDropDown
import Alamofire
class DealsPopUpViewController: UIViewController {
    @IBOutlet weak var selectStateTextField: DropDown!
    @IBOutlet weak var selectHouseTextField: DropDown!
    private var responseJSON: JSON!
    @IBOutlet weak var selectZoneTextField: DropDown!
    private var numberOfStates: Int!
    private var selectedState: String = ""
       private var selectedZone: String = ""
       private var selectedHouse: String = ""
    private var stateList: [String] = []
       private var ZoneList: [String] = []
       private var HouseList: [String] = []
       private var url: URL = URL(string: "https://quickworkz.com/wv/controller/memberlist.php?type=HubName")!
    @IBAction func okButtonPressed(_ sender: Any) {
        
            let storyBoard: UIStoryboard = UIStoryboard(name:"Deals", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier:"viewDealsViewController") as! DealViewController
                    
                    newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    self.present(newViewController, animated: true, completion: { () in
                     
                        newViewController.selectHouseButton.titleLabel?.text = self.selectedHouse
                        
                    })
        
    }
    @IBAction func canelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
  getData()
       
    }
    
    
    
    //MARK:- Networking
    func loadStates(){
           
                  self.numberOfStates = responseJSON["hubwisememberlistdetails"].count
           for i in self.numberOfStates{
               self.stateList.append(responseJSON["hubwisememberlistdetails"][i]["StateName"].stringValue)
                                     
                                 }
        
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
               print(ZoneList)
           }
           self.selectZoneTextField.optionArray = ZoneList
           selectZoneTextField.didSelect { (selectedText, index, id) in
               self.selectZoneTextField.placeholder = selectedText
               self.selectedZone = selectedText
               self.responseJSON = self.responseJSON["zoneList"][index]
               self.loadHouse()
           }
           print(responseJSON!)
       }
       func loadHouse(){
               let numberOfHouses = responseJSON["houseList"].count
           for i in numberOfHouses{
               self.HouseList.append(responseJSON["houseList"][i]["HouseName"].stringValue)
               print(HouseList)
           }
           self.selectHouseTextField.optionArray = HouseList
           selectHouseTextField.didSelect { (selectedText, index, id) in
               self.selectHouseTextField.placeholder = selectedText
               self.selectedHouse = selectedText
               
               selectedAppHouse = selectedText
           }
       }
       func getData(){
           let parameters: [String: String] = [
                  "token": UserDefaults.standard.string(forKey: "token")!,
                   ];
           Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
               if response.result.isSuccess {
                   self.responseJSON = JSON(response.result.value!)
                 
                   self.loadStates()
               }
               else {
                   print("State House List Error\(String(describing: response.result.error))")
                    self.showToast(message : "Connection Issues", color: UIColor.gray)
               }
           }
           
       }



  
}
