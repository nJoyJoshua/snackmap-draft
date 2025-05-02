//
//  SupplierNotification.swift
//  SnackMapEntwurf
//
//  Created by Leonie Granz on 29.04.25.
//


import Foundation

struct SupplierNotification: Identifiable {
    let id: UUID = UUID()
    let sender: String
    let message: String
    
}
