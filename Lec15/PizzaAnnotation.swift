//
//  PizzaAnnotation.swift
//  Lec15
//
//  Created by HackerU on 11/06/2018.
//  Copyright © 2018 HackerU. All rights reserved.
//

import UIKit
import MapKit

// this is a class to implement the annotation protocol

// NSObject allows to track down in real time the changes of the object properties
// see what heppends if you try to remove the NSObject, you'll have to implement something called NSObjectProtocole

class PizzaAnnotation: NSObject , MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String? ) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
    }

}
