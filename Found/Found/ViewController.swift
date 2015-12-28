//
//  ViewController.swift
//  Found
//
//  Created by abdelrahman mohamed on 12/27/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var pin: Pin?
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.setUserTrackingMode(.Follow, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let width = 1000.0
        let height = 1000.0
        
        let region = MKCoordinateRegionMakeWithDistance(center, width, height)
        
        mapView.setRegion(region, animated: true)
    }

    @IBAction func dropPin(sender: UIBarButtonItem) {
        pin = Pin(coordinate: mapView.userLocation.coordinate)
        mapView.addAnnotation(pin!)
    }
    @IBAction func deletePin(sender: UIBarButtonItem) {
        if let pinOnMap = pin{
            mapView.removeAnnotation(pinOnMap)
        }
    }
    @IBAction func shareLocation(sender: UIBarButtonItem) {
    // ToBeDone: implement sharing map location, if not share image capture from view
        
        let activityController = UIActivityViewController(activityItems: ["Check out our really cool app"], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }
}
