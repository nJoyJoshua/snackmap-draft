//
//  ContentView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 25.04.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = true
    
    @EnvironmentObject var router: SheetRouter
    
    var body: some View {
        ZStack {
            MapView()
        }
        .sheet(isPresented: $showSheet) {
            sheetView(for: router.current)
                .presentationDetents([.height(50), .medium, .large], selection: $router.currentDetent)
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
                .presentationBackgroundInteraction(.enabled)
        }
        
    }
    
    
    @ViewBuilder
    func sheetView(for sheet: AppSheet) -> some View {
        ScrollView {
            
            HStack{
                Text(sheet.displayName)
                    .foregroundStyle(.primary)
                    .font(.title2 .bold())
                    .padding(.leading)
                Spacer()
            if sheet == .recommendations {
                Button(action: {
                    router.present(sheet: .createMachine, detent: .large)
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 28))
                        .foregroundStyle(Color.accentColor)
                }
                
                Button ( action: {
                    router.present(sheet: .profile, detent: .large)
                } ) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 28))
                        .foregroundStyle(Color.accentColor)
                        .overlay(alignment: .topTrailing) {
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 18, height: 18)
                                
                                Text("5")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                            }
                            .offset(x: 6, y: -6)
                        }
                        .padding(.trailing)
                }
            } else {
                Button(action: {
                    router.present(sheet: .recommendations, detent: .height(50))
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 28))
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.gray)
                        .padding(16)
                }
            }
                    
                }
                .padding(.top)
                .frame(height: 50)
            

            Divider()
            

            
            switch sheet {
            case .profile:
                ProfileView()
            case .recommendations:
                RecommendationView()
            case .createMachine:
                CreateVendingMachineView()
            case .machineDetail(let machine):
                MachineDetailView(machine: machine)
            }
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
        ContentView()
            .environmentObject(VendingMachineViewModel())
            .environmentObject(UserLocationService())
            .environmentObject(SupplierNotificationViewModel())
            .environmentObject(SheetRouter())
    
}
