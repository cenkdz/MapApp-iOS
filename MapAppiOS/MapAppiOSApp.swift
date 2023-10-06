//
//  MapAppiOSApp.swift
//  MapAppiOS
//
//  Created by Cenk Donmez on 5.10.2023.
//

import SwiftUI

@main
struct MapAppiOSApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
