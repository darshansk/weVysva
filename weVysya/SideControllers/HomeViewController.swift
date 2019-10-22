//
//  HomeViewController.swift
//  weVysya
//
//  Created by Centura on 17/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let transiton = SlideInTransition()

    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = userImage.frame.width/2
        userImage.clipsToBounds = true
       
        
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
       guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        
    
        
        switch menuType {
        case .editProfile:
            self.performSegue(withIdentifier: "editProfileSegue", sender: self)
        case .viewLink:
            self.performSegue(withIdentifier: "viewLinkSegue", sender: self)
        case .viewDeal:
            self.performSegue(withIdentifier: "viewDealSegue", sender: self)
        case .viewOnetoOne:
        self.performSegue(withIdentifier: "viewOnetoOneSegue", sender: self)
        case .viewSupport:
            self.performSegue(withIdentifier: "viewSupportSegue", sender: self)
        case .renew:
            self.performSegue(withIdentifier: "renewSegue", sender: self)
        case .contactUs:
            self.performSegue(withIdentifier: "contactUsSegue", sender: self)
        case .faq:
            self.performSegue(withIdentifier: "faqSegue", sender: self)
        case .support:
            self.performSegue(withIdentifier: "supportSegue", sender: self)
        case .logout:
            self.logOut()
        }
        
    }
    func logOut(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let newViewController = storyBoard.instantiateViewController(withIdentifier: "LogInViewController")
        
                           self.present(newViewController, animated: true, completion: nil)
    }
}


