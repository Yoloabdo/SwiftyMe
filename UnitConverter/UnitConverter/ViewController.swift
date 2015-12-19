    //
//  ViewController.swift
//  UnitConverter
//
//  Created by abdelrahman mohamed on 11/9/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var tempLabel: UILabel!
    
    private let converter = UnitConverter()
    
    let dataSource = TemperatureRange()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
        
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //tempLabel.text = "\(converter.degreesFahrenheit(temperatureValues[row]))°F"
    }

}

