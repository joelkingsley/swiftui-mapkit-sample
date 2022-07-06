//
//  RouteDetailScreen.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 05/07/2022.
//

import SwiftUI
import MapKit

struct RouteDetailScreen: View {
    private var fastestRoute: FastestRoute
    @State var routeSelected: Int
    @State var mapRegion: MKCoordinateRegion
    @State var locations: [CLLocationCoordinate2D]
    
    init(fastestRoute: FastestRoute) {
        self.fastestRoute = fastestRoute
        routeSelected = 0
        mapRegion = MKCoordinateRegion()
        locations = [CLLocationCoordinate2D]()
    }
    
    func incrementRoute() {
        self.routeSelected = (routeSelected + 1) % fastestRoute.routes.count
    }
    
    func updateStates() {
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
        var locations = [CLLocationCoordinate2D]()
        if let trails = route.trails {
            locations.append(
                contentsOf: trails.map({ trail in
                    CLLocationCoordinate2D(
                        latitude: trail.latitude,
                        longitude: trail.longitude
                    )
                })
            )
        } else {
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
        }
        self.locations = locations
    }
    
    var body: some View {
        VStack {
            MapView(region: $mapRegion, lineCoordinates: $locations)
                .ignoresSafeArea(.all)
            Button("Route \(routeSelected)") {
                withAnimation {
                    incrementRoute()
                    updateStates()
                }
            }
            .onAppear(perform: {
                routeSelected = 0
                updateStates()
            })
        }
    }
}

struct RouteDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailScreen(fastestRoute:
            FastestRoute(
                routeTitle: "",
                routes: [],
                totalDuration: "",
                totalFare: 0,
                totalDistance: 0
            )
        )
    }
}
