//
//  AddMachineView.swift
//  SnackMapEntwurf
//
//  Created by Leonie Granz on 01.05.25.
//

import SwiftUI
import MapKit

struct CreateVendingMachineView: View {
    @EnvironmentObject var vendingMachineViewModel: VendingMachineViewModel
    @EnvironmentObject var userLocationService: UserLocationService
    @EnvironmentObject var sheetRouter: SheetRouter
    
    @State private var name: String = ""
    @State private var selectedCategory: VendingCategory = .snack
    @State private var selectedLocation: CLLocationCoordinate2D?
    @State private var mapPosition: MapCameraPosition = .automatic
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Name Field
                NameFieldView(name: $name)
                
                // MARK: - Category Picker
                CategoryPickerView(selectedCategory: $selectedCategory)
                
                // MARK: - Map Location
                MapLocationView(
                    mapPosition: $mapPosition,
                    selectedLocation: $selectedLocation,
                    setMapPositionToUserLocation: setMapPositionToUserLocation
                )
                
                // MARK: - Save Button
                SaveButtonView(saveAction: saveVendingMachine)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .tint(.accentColor)
    }
    
    // MARK: - Save Action
    
    private func saveVendingMachine() {
        guard let location = selectedLocation else { return }
        let newMachine = VendingMachine(
            name: name,
            latitude: location.latitude,
            longitude: location.longitude,
            category: selectedCategory
        )
        vendingMachineViewModel.addMachine(machine: newMachine)
        sheetRouter.present(sheet: .recommendations, detent: .height(50))
    }
    
    private func setMapPositionToUserLocation() {
        guard let location = userLocationService.location else { return }
        mapPosition = .region(
            MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: 200,
                longitudinalMeters: 200
            )
        )
    }
}

// MARK: - Name Field View

private struct NameFieldView: View {
    
    @Binding var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Name des Automaten")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(uiColor: .secondarySystemBackground))
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    
                    TextField("Automaten Name", text: $name)
                        .foregroundColor(.primary)
                        .overlay(alignment: .trailing) {
                            if !name.isEmpty {
                                Button(action: { name = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.secondary)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .scrollDismissesKeyboard(.interactively)

                }
                .padding(8)
            }
        }
    }
}

// MARK: - Category Picker View

private struct CategoryPickerView: View {
    
    @Binding var selectedCategory: VendingCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Kategorie")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(uiColor: .secondarySystemBackground))
                
                Picker("Kategorie", selection: $selectedCategory) {
                    ForEach(VendingCategory.allCases, id: \.self) { option in
                        Text(option.displayName)
                            .foregroundColor(.primary)
                            .tag(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
            }
            .frame(height: 44)
        }
    }
}

// MARK: - Map Location View

private struct MapLocationView: View {
    
    @Binding var mapPosition: MapCameraPosition
    @Binding var selectedLocation: CLLocationCoordinate2D?
    var setMapPositionToUserLocation: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Position")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ZStack {
                Map(position: $mapPosition) {
                    UserAnnotation()
                }
                .mapStyle(.hybrid)
                .mapControls {
                    MapUserLocationButton()
                }
                .onMapCameraChange { cameraContext in
                    selectedLocation = cameraContext.camera.centerCoordinate
                }
                
                //                Image(systemName: "pin")
                //                    .font(.system(size: 40))
                //                    .foregroundColor(.red)
                //                    .offset(y: -16)
                Text("📍")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                    .offset(y: -16)
            }
            .cornerRadius(8)
            .onAppear {
                setMapPositionToUserLocation()
            }
        }
        .frame(height: 300)
    }
}

// MARK: - Save Button View

private struct SaveButtonView: View {
    
    var saveAction: () -> Void
    
    var body: some View {
        Button(action: saveAction) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.accentColor)
                .frame(height: 44)
                .overlay(
                    Text("Speichern")
                        .font(.headline)
                        .foregroundStyle(.white)
                )
        }
    }
}

// MARK: - Preview

#Preview {
    CreateVendingMachineView()
        .environmentObject(UserLocationService())
        .environmentObject(VendingMachineViewModel())
        .environmentObject(SheetRouter())
}
