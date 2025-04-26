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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vendingMachineViewModel)
        }
    }
}
