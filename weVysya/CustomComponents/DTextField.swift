//
//  TextField.swift
//  weVysya
//
//  Created by Darshan Sk on 10/14/19.
//  Copyright © 2019 DarshanSk. All rights reserved.
//


import UIKit

class DTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        tintColor             = .white
        textColor             = .white
        
        font                  = UIFont(name: "Times New Roman Bold ", size: 25)
        //font = UIFont(name: "Times", size: <#T##CGFloat#>)
        backgroundColor       = UIColor(white: 1.0, alpha: 0.5)
        autocorrectionType    = .no
        layer.cornerRadius    = layer.frame.height/1.5
        clipsToBounds         = true
        
        let placeholder       = self.placeholder != nil ? self.placeholder! : ""
        let placeholderFont   = UIFont(name: "Times New Roman", size: 25)!
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
             NSAttributedString.Key.font: placeholderFont])
        
        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView              = indentView
        leftViewMode          = .always
    }
}
