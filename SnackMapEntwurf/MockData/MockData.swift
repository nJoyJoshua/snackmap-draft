//
//  MockData.swift
//  SnackMapEntwurf
//
//  Created by Leonie Granz on 07.05.25.
//

import Foundation

struct MockData {
    
    static let vendingMachines: [VendingMachine] = [
        VendingMachine(
            name: "Snackautomat - Main Entrance",
            latitude: 37.3345,
            longitude: -122.0090,
            category: .snack
        ),
        VendingMachine(
            name: "Getränkeverkauf - North Garden",
            latitude: 37.3350,
            longitude: -122.0102,
            category: .drinks
        ),
        VendingMachine(
            name: "Süßigkeitenautomat - Visitor Center",
            latitude: 37.3339,
            longitude: -122.0078,
            category: .sweets
        ),
        VendingMachine(
            name: "Obststand - East Park",
            latitude: 37.3354,
            longitude: -122.0085,
            category: .fruit
        ),
        VendingMachine(
            name: "Grillimbiss - Cafe Area",
            latitude: 37.3334,
            longitude: -122.0095,
            category: .grill
        ),
        VendingMachine(
            name: "Fast Food - South Side",
            latitude: 37.3341,
            longitude: -122.0101,
            category: .fastFood
        ),
        VendingMachine(
            name: "Bauernprodukte - West Lawn",
            latitude: 37.3352,
            longitude: -122.0079,
            category: .farmers
        ),
        VendingMachine(
            name: "Zigarettenautomat - Garage Entrance",
            latitude: 37.3348,
            longitude: -122.0083,
            category: .cigarettes
        ),
        VendingMachine(
            name: "24/7 Snacks - Parking Lot",
            latitude: 37.3351,
            longitude: -122.0098,
            category: .snack
        ),
        VendingMachine(
            name: "Kaffeeautomat - Library Annex",
            latitude: 37.3338,
            longitude: -122.0105,
            category: .drinks
        )
    ]
    
}
