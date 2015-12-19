//
//  TemperatureRange.swift
//  UnitConverter
//
//  Created by abdelrahman mohamed on 11/12/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import Foundation
import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource  {
    
    let values = (-100...100).map { $0 }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,  numberOfRowsInComponent component: Int) -> Int {
            return values.count
    }
    
    
    
}