//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by abdelrahman mohamed on 11/11/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import Foundation

class UnitConverter {
    
    
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
}