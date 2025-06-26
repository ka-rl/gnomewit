//
//  PlotModel.swift
//  gnomewit
//
//  Created by yelloxmo on 6/13/25.
//

import Foundation

struct Plot: Identifiable, Codable {
    let id: UUID
    var name: String
    var plants: [Plant]
    var location: String?
    
    init(id: UUID = UUID(), name: String, location: String, plants: [Plant] = []) {
        self.id = id
        self.name = name
        self.plants = plants
        self.location = location
    }
}

extension Plot {
    mutating func addPlant(_ plant: Plant) {
        plants.append(plant)
    }

    mutating func removePlant(withId plantId: UUID) {
        plants.removeAll { $0.id == plantId }
    }
}
