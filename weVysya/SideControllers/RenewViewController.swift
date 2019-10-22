//
//  RenewViewController.swift
//  weVysya
//
//  Created by Centura on 21/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import WebKit
class RenewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        webView.load(URLRequest(url: URL(string: "https://www.wevysya.com/renewal.php")!))
      webView.backgroundColor = .white
    }
}
