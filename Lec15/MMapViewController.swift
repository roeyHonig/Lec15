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

class MMapViewController: UIViewController {
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

