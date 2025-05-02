//
//  Machine.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import Foundation
import MapKit
import SwiftUICore

struct VendingMachine: Identifiable, Hashable, Equatable {
    var id: UUID = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    var category: VendingCategory
    
    var coordinates : CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: VendingMachine, rhs: VendingMachine) -> Bool {
        lhs.id == rhs.id
    }
}

enum VendingCategory: String, CaseIterable {
    case snack = "SNACK"
    case cigarettes = "CIGARETTES"
    case farmers = "FARMERS"
    case grill = "GRILL"
    case drinks = "DRINKS"
    case sweets = "SWEETS"
    case fastFood = "FAST FOOD"
    case fruit = "FRUIT"
    
    var displayName: String {
        switch self {
        case .snack: return "Snack"
        case .cigarettes: return "Zigaretten"
        case .farmers: return "Bauern"
        case .grill: return "Grill"
        case .drinks: return "Getränke"
        case .sweets: return "Süßigkeiten"
        case .fastFood: return "Fast Food"
        case .fruit: return "Obst"
        }
    }
    
    var color: Color {
        switch self {
        case .snack:
            return Color(red: 1.00, green: 0.58, blue: 0.00)
        case .cigarettes:
            return Color(red: 0.45, green: 0.45, blue: 0.50)
        case .farmers:
            return Color(red: 0.30, green: 0.69, blue: 0.31)
        case .grill:
            return Color(red: 0.89, green: 0.18, blue: 0.14)
        case .drinks:
            return Color(red: 0.00, green: 0.48, blue: 1.00)
        case .sweets:
            return Color(red: 0.99, green: 0.24, blue: 0.57)
        case .fastFood:
            return Color(red: 1.00, green: 0.80, blue: 0.00)
        case .fruit:
            return Color(red: 0.40, green: 0.80, blue: 0.40)
        }
    }
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [color.opacity(0.8), color]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var icon: String {
        switch self {
        case .snack: return "bag.fill"
        case .cigarettes: return "smoke.fill"
        case .farmers: return "leaf.fill"
        case .grill: return "flame.fill"
        case .drinks: return "cup.and.saucer.fill"
        case .sweets: return "hare.fill"
        case .fastFood: return "takeoutbag.and.cup.and.straw"
        case .fruit: return "applelogo"
        }
    }
}
