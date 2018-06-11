//
//  MMapViewController.swift
//  Lec15
//
//  Created by HackerU on 10/06/2018.
//  Copyright © 2018 HackerU. All rights reserved.
//

import UIKit
import MapKit // i have to add this framework in order to use maps
// how will i know the map view is ready
// how will i know it went to the internet it got the map
// and everything is ik?

// well, i start with delegate.
// i want to be the map delegate

import CoreLocation // technically no need cause MapKit allready includes it


class MMapViewController: UIViewController {
    let lm = CLLocationManager() // we also want to be the delegate
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        
        }
        
    }
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self // but don't forget to implement
        // the correct protocol
        // by beeing the delegate i'm telling the mapView
        // to notify me regarding specific events
        // such as: the map is ready or something went wrong (internet?)
        
        
        // be the delegate of lm
        lm.delegate = self
        
        
        // show current location
        
        // request location update
        // so let's cheack if we have permission
        // the function for thus is in the file LocationUtil.swift
        if hasPermision() {
            startUpdatingLocation()
            mapView.showsUserLocation = true
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func startUpdatingLocation() {
        // from where are we asking the location
        // we'll decide desiered acuurecy
        // and based on that Apple will choose GPS or another
        // anthenea
        
        lm.desiredAccuracy = kCLLocationAccuracyBest
        // lm.distanceFilter = 10.0 // distance in meteres for when location update is generated
        lm.distanceFilter = kCLDistanceFilterNone
        lm.startUpdatingLocation()
    }
}




extension MMapViewController : MKMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Map is Loaded")
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("There is an error: \(error.localizedDescription)")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // tap events on marker
        print("map is tapped")
    }
}

extension MMapViewController : CLLocationManagerDelegate {
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        
        let loc = locations[0]
        //mapView.setCenter(loc.coordinate, animated: true)
        let region = MKCoordinateRegionMakeWithDistance(loc.coordinate, 100, 100)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    // Authorization change
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            print("We have Permisions")
            // request location updates...TODO
        } else {
            print("Not Authorized")
        }
        
        
    }}
