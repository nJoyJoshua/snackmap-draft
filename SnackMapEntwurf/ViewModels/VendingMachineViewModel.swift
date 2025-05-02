//
//  MachineViewModel.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import Foundation


class VendingMachineViewModel: ObservableObject {
    
    @Published var machines: [VendingMachine] = []
    
    init() {
        machines = [
            VendingMachine(
                name: "Snackautomat - Hauptbahnhof",
                latitude: 52.5256,
                longitude: 13.3695,
                category: .snack
            ),
            VendingMachine(
                name: "Getränkeverkauf - Tiergarten",
                latitude: 52.5145,
                longitude: 13.3501,
                category: .drinks
            ),
            VendingMachine(
                name: "Süßigkeitenautomat - Alexanderplatz",
                latitude: 52.5219,
                longitude: 13.4132,
                category: .sweets
            ),
            VendingMachine(
                name: "Obststand - Potsdamer Platz",
                latitude: 52.5096,
                longitude: 13.3766,
                category: .fruit
            ),
            VendingMachine(
                name: "Grillimbiss - Mauerpark",
                latitude: 52.5415,
                longitude: 13.4026,
                category: .grill
            ),
            VendingMachine(
                name: "Fast Food - Kurfürstendamm",
                latitude: 52.5022,
                longitude: 13.3234,
                category: .fastFood
            ),
            VendingMachine(
                name: "Bauernprodukte - Markthalle Neun",
                latitude: 52.4998,
                longitude: 13.4374,
                category: .farmers
            ),
            VendingMachine(
                name: "Zigarettenautomat - Friedrichstraße",
                latitude: 52.5200,
                longitude: 13.3867,
                category: .cigarettes
            ),
            VendingMachine(
                name: "24/7 Snacks - Hauptbahnhof Süd",
                latitude: 52.5249,
                longitude: 13.3692,
                category: .snack
            ),
            VendingMachine(
                name: "Kaffeeautomat - Universitätsbibliothek",
                latitude: 52.4526,
                longitude: 13.2892,
                category: .drinks
            )
        ]
    }
    
    func addMachine(machine: VendingMachine) {
        machines.append(machine)
    }
    
}
