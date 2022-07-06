//
//  GetFastestRoutesUseCase.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import Foundation

class GetFastestRoutesUseCase {
    let routesRepository: RoutesRepository = JsonRoutesRepository()
    
    func execute() -> FastestRoutes {
        do {
            return try routesRepository.getFastestRoutesData()
        } catch {
            print(error)
            return []
        }
    }
}
