//
//  MyPerformanceViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 11/7/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MyPerformanceViewController: UIViewController {

    @IBOutlet weak var visitorsConvertedLabel: UILabel!
    @IBOutlet weak var visitorsReferredLabel: UILabel!
    @IBOutlet weak var memberPhoto: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var totalLinksLabel: UILabel!
    @IBOutlet weak var totalDealsLabel: UILabel!
    @IBOutlet weak var totalMeetingsAttendedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        loadData()
        
    }
    
//MARK:- Networking
    func loadData(){
        let url = URL(string: "https://quickworkz.com/wv/controller/myperformance.php?type=GetMyPerformance")!
        let parameters: [String: String] = [
            "token": UserDefaults.standard.string(forKey: "token")!,
            "MemberId": UserDefaults.standard.string(forKey: "id")!
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            if response.result.isSuccess{
                let responseJSON: JSON = JSON(response.result.value!)
                print(responseJSON)
                self.visitorsConvertedLabel.text = responseJSON["totalVisitorsConverted"].stringValue
                self.visitorsReferredLabel.text = responseJSON["totalVisitorsReferred"].stringValue
                self.memberName.text = responseJSON["memberName"].stringValue
                self.companyName.text = responseJSON["companyName"].stringValue
                self.totalLinksLabel.text = responseJSON["totalConnects"].stringValue
                self.totalDealsLabel.text = responseJSON["totalTransactions"].stringValue
                self.totalMeetingsAttendedLabel.text = responseJSON["totalMeetingsAttended"].stringValue
                
                self.memberPhoto.load(imageUrl: responseJSON["imageUrl"].stringValue)
                self.removeSpinner()
            }
                
            else{
                print("SignInError\(String(describing:response.result.error))")
                        self.showToast(message : "Connection Issues", color: UIColor.gray)
                                }
                
            }
        }
        
    }

