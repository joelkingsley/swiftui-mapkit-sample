//
//  RouteDetailViewModel.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 05/07/2022.
//

import Foundation
import SwiftUI
import MapKit

struct RouteDetailViewModel {
    @Binding var routeSelected: Int
    @Binding var mapRegion: MKCoordinateRegion
    @Binding var locations: [CLLocationCoordinate2D]
    let fastestRoute: FastestRoute
    
    func updateStates() {
        // Route
        self.routeSelected = (routeSelected + 1) % fastestRoute.routes.count
        
        // Map Region
        let route = fastestRoute.routes[routeSelected]
        self.mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: (route.sourceLat + route.destinationLat)/2,
                longitude: (route.sourceLong + route.destinationLong)/2
            ),
            span: MKCoordinateSpan(
                latitudeDelta: abs(route.destinationLat - route.sourceLat) + abs(route.destinationLat - route.sourceLat)*(2/10),
                longitudeDelta: abs(route.destinationLong - route.sourceLong) + abs(route.destinationLong - route.sourceLong)*(2/10)
            )
        )
        
        // Location
        var locations = route.trails?.map({ trail in
            CLLocationCoordinate2D(
                latitude: trail.latitude,
                longitude: trail.longitude
            )
        }) ?? []
        locations.append(
            CLLocationCoordinate2D(
                latitude: route.sourceLat, longitude: route.sourceLong
            )
        )
        locations.append(
            CLLocationCoordinate2D(
                latitude: route.destinationLat, longitude: route.destinationLong
            )
        )
        self.locations = locations
    }

}
