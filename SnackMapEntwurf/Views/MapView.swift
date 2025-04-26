//
//  MapView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 52.5256, longitude: 13.3695),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    @Binding var showSheet: Bool
    @State private var selectedMachine: VendingMachine?
    @State private var showMachineDetail = false
    
    @EnvironmentObject var vendingMachineViewModel: VendingMachineViewModel
    
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(vendingMachineViewModel.machines) { machine in
                Annotation(machine.name, coordinate: machine.coordinates) {
                    MapAnnotation(machine: machine)
                        .onTapGesture {
                            selectedMachine = machine
                            showMachineDetail = true
                        }
                }
                .tag(machine)
                
            }
        }
        .mapStyle(.standard)
        .ignoresSafeArea()
        .popover(isPresented: $showMachineDetail) {
            MachineDetailView(isPresented: $showMachineDetail, machine: $selectedMachine)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .onDisappear {
                    showSheet = true
                }
                
        }
    }
}

extension MapView {
    private func MapAnnotation(machine: VendingMachine) -> some View{
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(machine.category.gradient)
                    .frame(width: 28, height: 28)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    )
                
                Image(systemName: machine.category.icon)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .offset(y: -6)
    }
}
#Preview {
    MapView(showSheet: .constant(true))
}
