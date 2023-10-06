//
//  LocationDetailView.swift
//  MapAppiOS
//
//  Created by Cenk Donmez on 6.10.2023.
//

import SwiftUI

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
                VStack(alignment: .leading, spacing: 16, content: {
                titleSection
                    Divider()
                    descriptionSection
            })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }

}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
}

extension LocationDetailView{
    
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
            VStack(alignment: .leading, spacing: 8, content: {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundColor(.secondary)
            })
        
    }
    
    private var descriptionSection: some View {
            VStack(alignment: .leading, spacing: 16, content: {
                Text(location.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if let url = URL(string: location.link){
                    Link("Read more on Wikipedia", destination: url)
                        .font(.headline)
                        .tint(.blue)
                }
            })
        
    }
    
    private var backButton: some View {
        Button(action: {
            vm.sheetLocation = nil
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(4.0)
                .padding()
        })
    }
}
