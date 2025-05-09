//
//  MapView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var mapSelection: VendingMachine?
    
    @EnvironmentObject var vendingMachineViewModel: VendingMachineViewModel
    @EnvironmentObject var userLocationService: UserLocationService
    @EnvironmentObject var sheetRouter: SheetRouter
    
    var body: some View {
        Map(position: $userLocationService.cameraPosition, selection: $mapSelection) {
            UserAnnotation()
            
            ForEach(vendingMachineViewModel.machines, id: \.self) { machine in
                Marker(machine.name, systemImage: machine.category.icon, coordinate: machine.coordinates)
                    .tint(machine.category.color)
            }
        }
        .mapStyle(.imagery)
        .mapControls{
            MapCompass()
            MapUserLocationButton()
            
        }
        .onChange(of: mapSelection, {
            if mapSelection != nil {
                sheetRouter.present(sheet: .machineDetail(machine: $mapSelection), detent: .medium)
                
            }
            
        })
        .onAppear {
            vendingMachineViewModel.fetchMachines()
        }
    }
}

#Preview {
    MapView()
        .environmentObject(UserLocationService())
        .environmentObject(VendingMachineViewModel())
}
