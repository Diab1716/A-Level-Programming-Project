//
//  ContentView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import SwiftUI
import SpriteKit

struct MenuView: View {
    var body: some View {
        
        NavigationView{
            
            
            VStack(alignment: .leading,spacing: 10){
                Image("MenuImage")
                    .resizable()
                    .frame(width: 320, height: 180)
            
                Spacer()
                NavigationLink(destination: SimulationListView()){
                    Text("Simulation List")
                }
                NavigationLink(destination: SettingsView()){
                    Text("Settings")
                }
                Spacer()
                Spacer()
            }.navigationTitle("Physics Simulator")
                                .navigationBarTitleDisplayMode(.large)
        }
    }
        
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
