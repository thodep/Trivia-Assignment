//
//  Model-Class.swift
//  Week4-Assignment
//
//  Created by tho dang on 2015-09-03.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import Foundation
import MapKit
import UIKit
import AddressBook

class Landmark: NSObject, MKAnnotation {
    var title: String
    var coordinate: CLLocationCoordinate2D
    var subtitle: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, subtitle: String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
        
    }
    //function to make  annotation callout info button opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = title
        
        return mapItem
    }
}
