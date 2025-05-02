//
//  SnackMapEntwurfApp.swift
//  SnackMapEntwurf
//
//  Created by Merry on 25.04.25.
//

import SwiftUI

@main
struct SnackMapEntwurfApp: App {
    @StateObject private var vendingMachineViewModel = VendingMachineViewModel()
    @StateObject private var userLocationService = UserLocationService()
    @StateObject private var supplierNotificationViewModel = SupplierNotificationViewModel()
    @StateObject private var router = SheetRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vendingMachineViewModel)
                .environmentObject(userLocationService)
                .environmentObject(supplierNotificationViewModel)
                .environmentObject(router)
        }
    }
}
