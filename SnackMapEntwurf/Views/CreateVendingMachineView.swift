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
                VStack(alignment: .leading, spacing: 12) {
                    Text("Name des Automaten")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.ultraThinMaterial)

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
                        }
                        .padding(8)
                    }
                }

                // MARK: - Category Picker
                VStack(alignment: .leading, spacing: 12) {
                    Text("Kategorie")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray6))

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

                // MARK: - Map Location
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

                        Image(systemName: "mappin")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .offset(y: -16)
                    }
                    .cornerRadius(8)
                    .onAppear {
                        setMapPositionToUserLocation()
                    }
                }
                .frame(height: 300)

                // MARK: - Save Button
                Button(action: saveVendingMachine) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.accentColor)
                        .frame(height: 44)
                        .overlay(
                            Text("Speichern")
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                }
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .tint(.accentColor)
    }

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

#Preview {
    CreateVendingMachineView()
        .environmentObject(UserLocationService())
        .environmentObject(VendingMachineViewModel())
        .environmentObject(SheetRouter())
}
