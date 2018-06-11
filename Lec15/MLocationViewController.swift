//
//  SecondViewController.swift
//  Lec15
//
//  Created by HackerU on 10/06/2018.
//  Copyright © 2018 HackerU. All rights reserved.
//

// we want to locate the user location
// 1). import
// 2). init CLLocationManager
// *). Permisions: pList & manually request permision
// 3). be the delegate of the locationManager

// inside the CLLocationManger there is a field of type CLLocationManagerDelegate? - it is a protocol
// any object that implements this protocol is, by definition (polymorpisim) a CLLocationManagerDelegate


import UIKit
import CoreLocation // CL

class MLocationViewController: UIViewController {

    let lm = CLLocationManager() // the locatioManager Object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lm.requestAlwaysAuthorization()
        lm.delegate = self
        
        if hasPermision() {
            let location = lm.requestLocation() // one location
            lm.startUpdatingLocation() // real time location
        } else {
            // send the user to the settings
            guard let url = URL(string: UIApplicationOpenSettingsURLString) else {return}
            // open the url
            UIApplication.shared.open(url, options: [:])
        
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hasPermision() -> Bool {
        var permision = false
        
        if CLLocationManager.locationServicesEnabled() {  // chack that the GPS is on
            let status = CLLocationManager.authorizationStatus()
            
            switch status{
            case .authorizedAlways, .authorizedWhenInUse :
                permision = true
            default:
                permision = false
            }
        }
        
        return permision
    }
}

extension MLocationViewController : CLLocationManagerDelegate {
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("UPdate Location")
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
        
        
    }
}
