//
//  MachineDetailView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

struct MachineDetailView: View {
    @Binding var isPresented: Bool
    
    @Binding var machine: VendingMachine?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(machine?.name ?? "Something went wrong...")
                        .font(.headline)
                    Text(machine?.category.displayName ?? "")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
            }
            Button(action: { isPresented = false }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.gray)
                    .padding(16)
            }
        }

    }
}

#Preview {
    let machine = VendingMachine(name: "Test", latitude: 23.424, longitude: 23.424, category: .farmers)
    MachineDetailView(isPresented: .constant(true), machine: .constant(machine))
}
