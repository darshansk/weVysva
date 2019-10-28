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
            viewlinks()
        case .viewDeal:
            viewDeals()
        case .viewOnetoOne:
                viewOnetoOne()
        case .viewVisitors:
            self.performSegue(withIdentifier: "viewVisitorsSegue", sender: self)
        case .renew:
            self.performSegue(withIdentifier: "renewSegue", sender: self)
        case .contactUs:
            self.performSegue(withIdentifier: "contactUsSegue", sender: self)
        case .faq:
            self.performSegue(withIdentifier: "faqSegue", sender: self)
        case .visitorRegistration:
            addVisitorView()
        case .addMeetingDate:
         meetingDate()
        case .logout:
            self.logOut()
        }
        
    }
   
    func addVisitorView(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "MeetingList", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vistorRegistrationViewController")
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
           self.present(newViewController, animated: true, completion: nil)
    }
    func meetingDate(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "MeetingDates", bundle: nil)
               let newViewController = storyBoard.instantiateViewController(withIdentifier: "addMeetingDateViewController")
               newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                  self.present(newViewController, animated: true, completion: nil)
    }
    func logOut(){
       
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LogInViewController")
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
           self.present(newViewController, animated: true, completion: nil)
    }
    func viewlinks(){
           let storyBoard: UIStoryboard = UIStoryboard(name: "Links", bundle: nil)
           let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewLinksViewController")
           newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
              self.present(newViewController, animated: true, completion: nil)
       }
    func viewDeals(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Deals", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewDealsViewController")
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
           self.present(newViewController, animated: true, completion: nil)
    }
    
    func viewOnetoOne(){
           let storyBoard: UIStoryboard = UIStoryboard(name: "OnetoOne", bundle: nil)
           let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewOneToOneViewController")
           newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
              self.present(newViewController, animated: true, completion: nil)
       }
}


