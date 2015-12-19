//
//  ViewController.swift
//  ConverterVi
//
//  Created by abdelrahman mohamed on 11/12/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var degreePicker: UIPickerView!
    
    let userDefaultsLastRowKey = "defaultCelsiusPickerRow"
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultPickerRow = initialPickerRow()
        degreePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        pickerView(degreePicker, didSelectRow: defaultPickerRow, inComponent: 0)
    }
    
    let converter = UnitConverter()
    
    func initialPickerRow() -> Int{
        // if saved instance, return it, otherwise return the default value
        let savedRow = NSUserDefaults.standardUserDefaults().integerForKey(userDefaultsLastRowKey)
        if savedRow != 0{
            return savedRow
        }else{
            return degreePicker.numberOfRowsInComponent(0) / 2
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var temperatureRange: TemperatureRange!

    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int,  inComponent component: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreesCelsius))°F"
        savedSelectedRow(row)
    }
    
    func savedSelectedRow(row: Int){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()

    }
}

