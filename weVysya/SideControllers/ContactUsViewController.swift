//
//  ContactUsViewController.swift
//  weVysya
//
//  Created by Centura on 21/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import WebKit
class ContactUsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://www.wevysya.com/contact.php")!))
        webView.backgroundColor = .white
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
