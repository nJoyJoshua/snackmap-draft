//
//  MachineDetailView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI
import MapKit

struct MachineDetailView: View {
    
    @Binding var machine: VendingMachine?
    
    @State private var lookAroundScene: MKLookAroundScene?
    
    @EnvironmentObject private var sheetRouter: SheetRouter
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(machine?.name ?? "Etwas ist schiefgelaufen...")
                        .font(.title)
                        .bold()
                    Text(machine?.category.displayName ?? "")
                        .font(.title3)
                    
                    if let scene = lookAroundScene {
                        LookAroundPreview(initialScene: scene)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding(.top, 8)
                    } else {
                        ContentUnavailableView("Keine Preview Verfügbar", systemImage: "eye.slash")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .onAppear {
                    fetchLookAroundScene()
                }
            }
            .onChange(of: sheetRouter.current) {
                machine = nil
            }
    }
    
    private func fetchLookAroundScene() {
        guard let machine = machine else { return }
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(coordinate: machine.coordinates)
            lookAroundScene = try? await request.scene
        }
        
    }
}

#Preview {
    let machine = VendingMachine(name: "Grillimbiss - Schule", latitude: 23.424, longitude: 23.424, category: .grill)
    MachineDetailView(machine: .constant(machine))
}
