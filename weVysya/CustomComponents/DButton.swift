//
//  DButton.swift
//  weVysya
//
//  Created by Darshan Sk on 10/14/19.
//  Copyright © 2019 DarshanSk. All rights reserved.
//

import UIKit

class DButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
       // let buttonImage = UIImage(named: "wevysya_login_back"
        
        backgroundColor = UIColor(patternImage: UIImage(named: "button")!)  
        titleLabel?.font    = UIFont(name: "avenirNextCondensedDemiBold", size: 22)
        layer.cornerRadius = frame.size.height/2
        setTitleColor(.white, for: .normal)
        //setBackgroundImage(buttonImage, for: .normal)
    }
}
