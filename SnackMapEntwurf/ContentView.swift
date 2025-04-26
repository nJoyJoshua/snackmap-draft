//
//  ContentView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 25.04.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = true
    @State var currentDetent: PresentationDetent = .height(50)
    
    var body: some View {
        ZStack {
            MapView(showSheet: $showSheet)
        }
        .sheet(isPresented: $showSheet) {
            SheetView(currentDetent: $currentDetent)
                .presentationDetents(
                    [.height(50), .medium, .large],
                    selection: $currentDetent
                )
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
                .presentationBackgroundInteraction(.enabled)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(VendingMachineViewModel())
}
