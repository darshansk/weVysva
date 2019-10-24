//
//  MenuViewController.swift
//  weVysya
//
//  Created by Centura on 18/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

    enum MenuType: Int {
        case editProfile
        case viewLink
        case viewDeal
        case viewOnetoOne
        case viewVisitors
        case renew
        case contactUs
        case faq
        case visitorRegistration
        case addMeetingDate
        case logout
        
}
class MenuViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row - 1) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
}
