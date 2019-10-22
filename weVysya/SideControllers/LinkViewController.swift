//
//  LinkViewController.swift
//  weVysya
//
//  Created by Darshan Sk on 10/22/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class LinkViewController: UIViewController {

    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedView.setTitle("LINK", forSegmentAt: 0)
        segmentedView.setTitle("MY LINK", forSegmentAt: 1)
        // Do any additional setup after loading the view.
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
