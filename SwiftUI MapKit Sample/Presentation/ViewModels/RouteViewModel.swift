//
//  RouteViewModel.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import Foundation

class RouteViewModel: ObservableObject {
    private let getFastestRoutesUseCase = GetFastestRoutesUseCase()
    
    let fastestRoutesData: FastestRoutes
    
    var sourceAddress: String {
        "HRBR Layout 1st Block, Kalyan Nagar, Bengaluru"
    }
    
    var destinationAddress: String {
        "Cafe Coffee Day - Barton Centre, MG Road, Bengaluru"
    }
    
    init() {
        self.fastestRoutesData = getFastestRoutesUseCase.execute()
        print(fastestRoutesData)
    }
}
