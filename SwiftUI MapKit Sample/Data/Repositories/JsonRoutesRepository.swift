//
//  JsonRoutesRepository.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import Foundation

class JsonRoutesRepository: RoutesRepository {
    func getFastestRoutesData() throws -> FastestRoutes {
        guard let url = Bundle.main.url(forResource: "response", withExtension: "json") else {
            throw NSError(domain: "JSON", code: 500)
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(FastestRoutes.self, from: data)
        return jsonData
    }
}
