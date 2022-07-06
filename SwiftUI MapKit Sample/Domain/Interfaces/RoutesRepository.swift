//
//  RoutesRepository.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import Foundation

protocol RoutesRepository {
    func getFastestRoutesData() throws -> FastestRoutes
}
