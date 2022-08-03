//
//  ViewController.swift
//  GI_Assignment
//
//  Created by Tatsuya Moriguchi on 8/2/22.
//

import UIKit
import MapKit


/*
 Create a table view that displays lat/long values. You can pick your own or use 37.789994, -122.412537 and 37.773713, -122.257012. When a location in the table is selected a map should display with a pin at the selected location.
 */

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    // location data collection (latitude, longtitude)
    let dataList = [(37.789994, -122.412537), (37.773713, -122.257012)]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // MapKit configuration
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let latitude = dataList[indexPath.row].0
        let longititude = dataList[indexPath.row].1
        
//        cell.textLabel?.text = "Latitude: " + String(latitude) + ", " + "Longitude: " +  String(longititude)
        cell.textLabel?.text = String(latitude) + ", " + String(longititude)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // show tapped location in map
        let lati = dataList[indexPath.row].0
        let longi = dataList[indexPath.row].1
        let locValue = CLLocationCoordinate2D(latitude: lati, longitude: longi)
        mapView.setCenter(locValue, animated: true)
        
        mapView.mapType = MKMapType.standard
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)

        // Add annotation to your current location
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "You are here"
        //annotation.subtitle = String(lati) + ", " + String(longi)
        mapView.addAnnotation(annotation)
        
    }
    
    
}

