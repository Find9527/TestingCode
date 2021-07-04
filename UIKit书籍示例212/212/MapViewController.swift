//
//  MapViewController.swift
//  212
//
//  Created by Orange on 2021/6/21.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmentControl = UISegmentedControl(items: ["standard", "Hybrid", "Satellite"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.addTarget(self, action: #selector(MapViewController.mapTypeChange(_:)), for: .valueChanged)
        
        view.addSubview(segmentControl)
        
        let guide = view.safeAreaLayoutGuide
        let margin = view.layoutMarginsGuide
        
        
        let topCon = segmentControl.topAnchor.constraint(equalTo:guide.topAnchor)
        let leaCon = segmentControl.leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        let traCon = segmentControl.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        
        topCon.isActive = true
        leaCon.isActive = true
        traCon.isActive = true
        
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("map loaded")
    }
    
    @objc func mapTypeChange(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
}
