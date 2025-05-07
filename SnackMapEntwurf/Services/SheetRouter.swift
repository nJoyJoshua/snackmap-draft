//
//  SheetRouter.swift
//  SnackMapEntwurf
//
//  Created by Leonie Granz on 02.05.25.
//

import Foundation
import SwiftUI

enum AppSheet: Identifiable, Equatable {
    static func == (lhs: AppSheet, rhs: AppSheet) -> Bool {
        return lhs.id == rhs.id
    }
    
    case recommendations
    case profile
    case createMachine
    case machineDetail(machine: Binding<VendingMachine?>)
    
    var id: String {
        switch self {
        case .recommendations:  return "recommendations"
        case .profile:  return "profile"
        case .createMachine:    return "createMachine"
        case .machineDetail(_): return "machineDetail"
        }
    }
    
    
    
    var displayName: String {
        switch self {
        case .recommendations:  return "Empfehlungen"
        case .profile:   return "Profil"
        case .createMachine: return "Neu Erstellen"
        case .machineDetail(_): return "Details"
        }
    }
    
    var defaultDetent: PresentationDetent {
        switch self {
        case .recommendations:  return .medium
        case .profile:   return .large
        case .createMachine: return .large
        case .machineDetail(_): return .medium
        }
    }
}


final class SheetRouter: ObservableObject {
    @Published var current: AppSheet = .recommendations
    @Published var currentDetent: PresentationDetent = .height(50)
    
    func present(sheet: AppSheet, detent: PresentationDetent? = nil ) {
        current = sheet
        if let detent = detent {
            currentDetent = detent
        }
    }
    
    
}
