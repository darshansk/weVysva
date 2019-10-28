//
//  HouseViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/25/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var houseTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //assign tableview delegates
        houseTableView.delegate = self
        houseTableView.dataSource = self
        
        houseTableView.register(UINib(nibName: "HousesCell", bundle: nil), forCellReuseIdentifier: "houseCardCell")
        configureCell()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = houseTableView.dequeueReusableCell(withIdentifier: "houseCardCell", for: indexPath) as! HousesCell
        return cell
    }
    func configureCell(){
        houseTableView.rowHeight = 100.0
        houseTableView.estimatedRowHeight = 100.0
    }

}
