//
//  MachineViewModel.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import Foundation


class VendingMachineViewModel: ObservableObject {
    
    @Published var machines: [VendingMachine] = []
    
    
    func fetchMachines() {
        #if targetEnvironment(simulator)
            machines = MockData.vendingMachines
        #else
            //real fetching logic
        #endif
    }
    
    func addMachine(machine: VendingMachine) {
        machines.append(machine)
    }
    
}
