//
//  File.swift
//  GI_Assignment
//
//  Created by Tatsuya Moriguchi on 8/2/22.
//

import Foundation
import MapKit


class GetMap {

// locate on a map with latidude and longitude
public func openMapForPlace(lat:Double = 0, long:Double = 0, placeName:String = "") {
    let latitude: CLLocationDegrees = lat
    let longitude: CLLocationDegrees = long

    let regionDistance:CLLocationDistance = 100
    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
    let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
    let options = [
        MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
        MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
    ]
    let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = placeName
    mapItem.openInMaps(launchOptions: options)
}

}
