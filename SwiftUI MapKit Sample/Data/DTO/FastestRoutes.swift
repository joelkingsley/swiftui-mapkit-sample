//
//  FastestRoutes.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import Foundation

// MARK: - FastestRoute
struct FastestRoute: Hashable, Decodable {
    let routeTitle: String
    let routes: [Route]
    let totalDuration: String
    let totalFare: Int
    let totalDistance: Double
    
    var totalDurationString: String {
        let durationComponents = Array(totalDuration.split(separator: ":"))
        guard durationComponents.count == 3 else {
            return "00 seconds"
        }
        if durationComponents[0] != "00" {
            return durationComponents[0] + " hrs"
        } else if durationComponents[1] != "00" {
            return durationComponents[1] + " mins"
        } else if durationComponents[2] != "00" {
            return durationComponents[2] + " secs"
        }
        return "00 seconds"
    }
}

// MARK: - Route
struct Route: Hashable, Decodable {
    let sourceLat, sourceLong: Double
    let sourceTitle: String
    let sourceTime: [String]
    let destinationLat, destinationLong: Double
    let destinationTitle: String
    let destinationTime: [String]
    let busRouteDetails: BusRouteDetails?
    let medium: Medium
    let duration: String
    let fare: Int
    let distance: Double
    let routeName: String?
    let trails: [Trail]?
    
    var durationString: String {
        let durationComponents = Array(duration.split(separator: ":"))
        guard durationComponents.count == 3 else {
            return "00 seconds"
        }
        if durationComponents[0] != "00" {
            return durationComponents[0] + " hrs"
        } else if durationComponents[1] != "00" {
            return durationComponents[1] + " mins"
        } else if durationComponents[2] != "00" {
            return durationComponents[2] + " secs"
        }
        return "00 seconds"
    }
}

// MARK: - BusRouteDetails
struct BusRouteDetails: Hashable, Decodable {
    let routeNumber, routeName, routeDescription: String
}

enum Medium: String, Hashable, Decodable {
    case bus = "Bus"
    case walk = "Walk"
}

// MARK: - Trail
struct Trail: Hashable, Decodable {
    let name: String
    let latitude, longitude, distance: Double
    let seq: Int
    let fareStage: FareStage
}

enum FareStage: String, Hashable, Decodable {
    case n = "N"
    case y = "Y"
}

typealias FastestRoutes = [FastestRoute]
