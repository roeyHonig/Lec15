//
//  LocationUtil.swift
//  Lec15
//
//  Created by HackerU on 11/06/2018.
//  Copyright © 2018 HackerU. All rights reserved.
//

import Foundation
import CoreLocation

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
