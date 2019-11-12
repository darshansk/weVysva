//
//  File.swift
//  weVysya
//
//  Created by Deekshith Ms on 15/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
extension UIView{
    
}
extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    //toast
    func showToast(message : String , color: UIColor = UIColor.green ) {
        let toastLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 - 75, y: UIScreen.main.bounds.height-100, width: UIScreen.main.bounds.width/2, height: 35))
        toastLabel.backgroundColor = color
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        self.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
        
    }
}
extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
var vSpinner: UIView?
extension UIImageView {
    func load(imageUrl: String) {
      
        let url = URL(string: imageUrl)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        
                        self?.image = image
                        
                    }
                }
            }
        }
    }
    
}
extension UIViewController {
    //SystemDate
    func systemDate() -> String{
        let date = Date()
                 let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
         var currentDate: String = ""
        
        currentDate = "\(components.year ?? 0)-\(components.month ?? 0)-\(components.day ?? 0)"
        return currentDate
       
    }
    //keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func keyboardToggle() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        
        self.hideKeyboardWhenTappedAround()
    }
    @objc func keyboardWillChange(notification: NSNotification) {
        print("yes")
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= (keyboardSize.height)
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    //spinner
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    //toast
    func showToast(message : String , color: UIColor = UIColor.green, textColor: UIColor = UIColor.white) {
        
        //      let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/4 , y: self.view.frame.size.height/2 , width: self.view.frame.size.width/2, height: 35))
        //        toastLabel.backgroundColor = color
        //        toastLabel.textColor = UIColor.white
        //        toastLabel.textAlignment = .center;
        //        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        //        toastLabel.text = message
        //        toastLabel.alpha = 1.0
        //        toastLabel.layer.cornerRadius = 10;
        //        toastLabel.clipsToBounds  =  true
        //        self.view.addSubview(toastLabel)
        //        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
        //            toastLabel.alpha = 0.0
        //        }, completion: {(isCompleted) in
        //            toastLabel.removeFromSuperview()
        //        })
        //    }
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = NSTextAlignment.center
        label.text = message
        label.font = UIFont(name: "", size: 15)
        label.adjustsFontSizeToFitWidth = true
        
        label.backgroundColor =  color //UIColor.whiteColor()
        label.textColor = textColor //TEXT COLOR
        
        label.sizeToFit()
        label.numberOfLines = 4
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity = 0.3
        label.frame = CGRect(x: appDelegate.window!.frame.size.width, y: ((appDelegate.window?.screen.bounds.height)!)-44, width: appDelegate.window!.frame.size.width, height: 44)
        label.alpha = 1
        appDelegate.window!.addSubview(label)
        var basketTopFrame: CGRect = label.frame;
        basketTopFrame.origin.x = 0;
        UIView.animate(withDuration
            :1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
                label.frame = basketTopFrame
        },  completion: {
            (value: Bool) in
            UIView.animate(withDuration:2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
                label.alpha = 0
            },  completion: {
                (value: Bool) in
                label.removeFromSuperview()
            })
        })
    }
    
    
    // CheckBox
    class CheckBox: UIButton {
        // Images
        let checkedImage = UIImage(named: "ic_check_box")! as UIImage
        let uncheckedImage = UIImage(named: "ic_check_box_outline_blank")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControl.State.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControl.State.normal)
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
        
        @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    }
}
