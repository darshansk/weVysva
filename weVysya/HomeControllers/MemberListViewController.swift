//
//  MemberListViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var memberListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       //assign table view delegates
        memberListTableView.dataSource = self
        memberListTableView.delegate = self
    
        memberListTableView.register(UINib(nibName: "MemberListCell", bundle: nil), forCellReuseIdentifier: "memberListCell")
        configureCells()
    }
    

    
    
    // MARK:- Table view Methods
    func configureCells(){
        memberListTableView.rowHeight = 120.0
        memberListTableView.estimatedRowHeight = 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberListTableView.dequeueReusableCell(withIdentifier: "memberListCell", for: indexPath) as! MemberListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    
    

}
