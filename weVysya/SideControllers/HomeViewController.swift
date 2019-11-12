//
//  HomeViewController.swift
//  weVysya
//
//  Created by Centura on 17/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import UIKit
import SDWebImage
class HomeViewController: UIViewController {
    let transiton = SlideInTransition()
    let defaultImageUrl = "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var memberButton: UIButton!
    override func viewDidLoad() {
 super.viewDidLoad()
        let imageURL = UserDefaults.standard.string(forKey: "memberphotoUrl") ?? defaultImageUrl
       userImage.layer.borderWidth=1.0
       userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.white.cgColor
       userImage.layer.cornerRadius = userImage.frame.size.height/2
       userImage.clipsToBounds = true
       
        userImage.load(imageUrl: imageURL)
     //   userImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "Profile.png"))
      
        userNameLabel.text = UserDefaults.standard.string(forKey: "memberName") ?? "WeVysva User" 
        
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
                openPage(storyboard: "Links", view: "ViewLinksViewController")
        case .viewDeal:
            openPage(storyboard: "Deals", view: "ViewDealsVC")
        case .viewOnetoOne:
                openPage(storyboard: "OnetoOne", view: "ViewOneToOneViewController")
        case .viewVisitors:
                openPage(storyboard: "MemberList", view: "viewVisitorsViewController")
        case .renew:
            self.performSegue(withIdentifier: "renewSegue", sender: self)
        case .contactUs:
            self.performSegue(withIdentifier: "contactUsSegue", sender: self)
        case .faq:
            self.performSegue(withIdentifier: "faqSegue", sender: self)
        case .visitorRegistration:
            openPage(storyboard: "MemberList", view: "vistorRegistrationViewController")
        case .addMeetingDate:
         openPage(storyboard: "MeetingDates", view: "addMeetingDateViewController")
        case .logout:
            
            self.logOut()
        }
        
    }

    
    func openPage(storyboard: String, view: String ){
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
              let newViewController = storyBoard.instantiateViewController(withIdentifier: view)
              newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                 self.present(newViewController, animated: true, completion: nil)
    }
    
    func logOut(){
       
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        openPage(storyboard: "Main", view: "LogInViewController")
        
    }

  
    
}


