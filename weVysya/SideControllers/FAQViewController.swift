//
//  FAQViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

struct CellData {
    var opened = Bool()
    var tittle = String()
    var sectionData = [String]()
}
class FAQViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var fawTableViewController: UITableView!
    @IBOutlet weak var faqTableView: CardView!
      
    var tableViewData = [CellData(opened: false, tittle: "Question1", sectionData: ["","Answer1"]),
                          CellData(opened: false, tittle: "Question2", sectionData: ["","Answer2"]),
                         CellData(opened: false, tittle: "Question3", sectionData: ["","Answer3"]),]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //assign delegates
        fawTableViewController.delegate = self
        fawTableViewController.dataSource = self
        
        
     
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count 
        }
        else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = fawTableViewController.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()};            cell.textLabel?.text = tableViewData[indexPath.section].tittle
            return cell
        }
        
        else{
            guard let cell = fawTableViewController.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()} ;
                      cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
                                return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableViewData[indexPath.row].opened == true{
            tableViewData[indexPath.row].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            fawTableViewController.reloadSections(sections, with: .none )
        
        }
        else{
            tableViewData[indexPath.row].opened =  true
            let sections = IndexSet.init(integer: indexPath.section)
                       fawTableViewController.reloadSections(sections, with: .none )
        }
     
        
    }
}
