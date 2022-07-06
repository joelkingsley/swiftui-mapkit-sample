//
//  MapView.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 06/07/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    @Binding var lineCoordinates: [CLLocationCoordinate2D]
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = region
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        mapView.addOverlay(polyline)
        return mapView
    }
    
    // Updates map when binding variable changes
    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = context.coordinator
        view.region = region
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        view.removeOverlays(view.overlays)
        view.addOverlay(polyline)
    }
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }

}
