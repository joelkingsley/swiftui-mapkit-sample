//
//  FastestRouteListItemViewModel.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 05/07/2022.
//

import Foundation
import SwiftUI

class FastestRouteListItemViewModel: ObservableObject {
    let fastestRoute: FastestRoute
    
    init(fastestRoute: FastestRoute) {
        self.fastestRoute = fastestRoute
    }
    
    var nextScheduledTime: String {
        return fastestRoute.routes.first?.sourceTime.first ?? ""
    }
    var estimatedPrice: String {
        return "$" + String(fastestRoute.totalFare)
    }
    var travelTime: String {
        return "~ " + fastestRoute.totalDurationString
    }
    var distance: String {
        return String(fastestRoute.totalDistance.rounded()) + " kms"
    }
    
    func getRectangeColor(forMedium medium: Medium) -> Color {
        switch medium {
        case .bus:
            return Color.yellow
        case .walk:
            return Color.blue
        }
    }
    
    func getMediumIconName(forMedium medium: Medium) -> String {
        switch medium {
        case .bus:
            return "bus.fill"
        case .walk:
            return "figure.walk"
        }
    }
}
