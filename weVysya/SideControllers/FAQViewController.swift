//
//  FAQViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var faqTableView: UITableView!
    
    var selectedIndex = -1
    var dataArray : [[String:String]] = [["FirstName" : "What is WeVysya?", "LastName" :"WeVysya is an organization formed to link Arya Vysya entrepreneurs across the globe."],
    ["FirstName" : "Why should I join?", "LastName" : "To strengthen your business end to end which includes links, advice, resources, advocacy, grants & funding, business assessments and communications."],
    ["FirstName" : "What next after joining?", "LastName" : "WeVysya organizes regular meetings where our members can interact and network with each other."],
    ["FirstName" : "Will I surely get business?", "LastName" : "It depends on active participation, products and services offered, however we do not guarantee any business."],
    ["FirstName" : "Should I attend meetings regularly? If I miss, will I lose my membership?", "LastName" : "No, we believe in growing together, however if attendance is less as per policy, A new person from the same category will be allowed."],
    ["FirstName" : "Validity of membership?", "LastName" : " 1 year from the date of registration."],
    ["FirstName" : "Will I get financial support from WeVysya?", "LastName" : "One of our objective is Grants & funding, we help to connect with Angel investors, VCs and Banks."],
    ["FirstName" : "Are there any hidden charges?", "LastName" : "No hidden charges as such, except registration fee and membership fee."],
    ["FirstName" : "What is the eligibility criteria?", "LastName" : "Any Arya Vysya entrepreneur who runs a business on his own and without any criminal background."],
    ["FirstName" : "If i can't attend meetings can someone else on my behalf attend?", "LastName" : "Yes, as per substitution policy a replacement is allowed when a member cannot attend due to important reasons."],
    ["FirstName" : "Do we have regular meetings?", "LastName" : "Yes every house will have regular meetings 15 days once."],
    ["FirstName" : "Regular Meeting fee?", "LastName" : "It varies from venue to venue and various cities."]]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(selectedIndex == indexPath.row) {
            return 100;
        }else {
            return 40
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let Cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! faqCustomCell
        let obj = dataArray[indexPath.row]
        Cell.firstViewLabel.text = obj["FirstName"]
        Cell.secondViewLabel.text = obj["LastName"]
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (selectedIndex == indexPath.row) {
            selectedIndex = -1
        }else {
            selectedIndex = indexPath.row
        }
        self.faqTableView.beginUpdates()
        self.faqTableView.reloadRows(at: [indexPath], with: .automatic)
        self.faqTableView.endUpdates()
    }
}
