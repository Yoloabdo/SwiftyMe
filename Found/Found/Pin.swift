//
//  Pin.swift
//  Found
//
//  Created by abdelrahman mohamed on 12/28/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//


import MapKit

class Pin: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
        
    }
    
}