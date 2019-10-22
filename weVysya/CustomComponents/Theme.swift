//
//  Theme.swift
//  weVysya
//
//  Created by Deekshith Ms on 15/10/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import Foundation
class Theme{
    private var backgroundR: Int = 0
    private var backgroundG: Int = 0
     private var backgroundB: Int = 0
    
    public func getBackgroundR() -> Int{
        return backgroundR;
    }
    public func getBackgroundG() -> Int{
        return backgroundG;
    }
    public func getBackgroundB() -> Int{
        return backgroundB;
    }
    public func setBackgroundR(Rvalue: Int){
            self.backgroundR = Rvalue;
    }
    public func setBackgroundG(Gvalue: Int) {
        self.backgroundG = Gvalue;
    }
    public func setBackgroundB(Bvalue: Int) {
        self.backgroundB = Bvalue;
    }
}
