//
//  PlantModel.swift
//  gnomewit
//
//  Created by yelloxmo on 6/13/25.
//

import Foundation

let DEFAULT_WATERFREQUENCYDAYS = 2
let DEFAULT_HARVESTFREQUENCYDAYS = 2
let DEFAULT_FERTILIZEFREQUENCYDAYS = 21

struct Plant: Identifiable, Codable {
    let id: UUID
    var name: String
    var species: String
    var datePlanted: Date
    var notes: String?
    
    var waterFrequencyDays: Int?
    var lastWatered: Date?
    var nextWateringDate: Date? {
        Calendar.current.date(byAdding: .day,
            value: waterFrequencyDays ?? DEFAULT_WATERFREQUENCYDAYS,
            to: lastWatered ?? Date()
        )
    }
    
    var harvestReminderFrequency: Int?
    var lastHarvested: Date?
    var nextHarvestDate: Date? {
        Calendar.current.date(
            byAdding: .day,
            value: harvestReminderFrequency ?? DEFAULT_HARVESTFREQUENCYDAYS,
            to: lastHarvested ?? Date()
        )
    }
    
    var fertilizeReminderFrequency: Int?
    var lastFertilized: Date?
    var nextFertilizeDate: Date? {
        Calendar.current.date(
            byAdding: .day,
            value: fertilizeReminderFrequency ?? DEFAULT_FERTILIZEFREQUENCYDAYS,
            to: lastFertilized ?? Date()
        )
    }

    
    
}
