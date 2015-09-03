//
//  MapViewController.swift
//  Week4-Assignment
//
//  Created by tho dang on 2015-09-03.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create an array of landmark
        var landmarkCollection = [
            Landmark(title: "CN Tower", coordinate: CLLocationCoordinate2D(latitude: 43.64251, longitude: -79.387038), subtitle: " The CN Tower is over 500 metres tall"),
        
            Landmark(title: "Casa Loma", coordinate: CLLocationCoordinate2D(latitude: 43.678, longitude: -79.41), subtitle: " Casa Loma  was built from the period 1911 to 1914"),
            Landmark(title: "Royal Ontario Museum", coordinate: CLLocationCoordinate2D(latitude: 43.667710,  longitude: -79.394777), subtitle: "The ROM is an indispensable resource for building community by nurturing discovery and inspiring wonder"),
            Landmark(title: "Art Gallery Ontario", coordinate: CLLocationCoordinate2D(latitude: 43.653607,longitude: -79.392512), subtitle: "An art museum in Toronto's Downtown Grange Park district"),
            Landmark(title: "Toronto Zoo", coordinate: CLLocationCoordinate2D(latitude: 43.817699,longitude: -79.185890), subtitle: "Canada's premier zoo known for its interactive education and conservation activities."),
            Landmark(title:  "Toronto Island", coordinate: CLLocationCoordinate2D(latitude: 43.628947,longitude: -79.394420), subtitle: " Toronto Islands provide a refreshing escape from downtown with beautiful views of Lake Ontario and the city skyline"),
            Landmark(title: "Hocky Hall of Fame", coordinate: CLLocationCoordinate2D(latitude: 43.647272,longitude: -79.377690), subtitle: "Dedicated to the history of ice hockey, it is both a museum and a hall of fame."),
            Landmark(title: "Distillery District", coordinate: CLLocationCoordinate2D(latitude: 43.650305,longitude: -79.359580), subtitle: "A historic and entertainment precinct located east of Downtown Toronto"),
            Landmark(title: "Rogers Centre", coordinate: CLLocationCoordinate2D(latitude: 43.641438,longitude: -79.389353), subtitle: " Formerly known as the Sky Dome"),
            Landmark(title: "Canada's Wonderland", coordinate: CLLocationCoordinate2D(latitude: 43.843018,longitude: -79.539463), subtitle: "Canada's Wonderland is a 330-acre (130 ha) theme park located in Vaughan, Ontario, a suburb approximately 40 kilometres (25 mi) north of Toronto")
            
        ]
        
        
         self.mapView.addAnnotations(landmarkCollection)
        
         mapSetUp()
    }
    
    func mapSetUp(){
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.showsUserLocation = true
          
        }
        // Zoom in Locations
        var centre: CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.6466,-79.3864)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.2, 0.2)
        var regionToDisplay = MKCoordinateRegionMake(centre, span)
        self.mapView.setRegion(regionToDisplay, animated: true)
   
    }

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        
        if let annotation = annotation as? Landmark {
            let identifier = "Landmark"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
        }
        return nil
    
    }
    
    //you have to tell MapKit what to do when the callout button is tapped
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!,
        calloutAccessoryControlTapped control: UIControl!) {
            let location = view.annotation as! Landmark
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            location.mapItem().openInMapsWithLaunchOptions(launchOptions)
    }
           override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
