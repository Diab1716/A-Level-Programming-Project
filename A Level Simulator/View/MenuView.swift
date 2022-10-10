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
        //Navigation View to allow easy movement between views
        NavigationView{
            
            //arranging the menu items in a vertical arrangement
            VStack(alignment: .leading,spacing: 10){
                //adding menu image
                Image("MenuImage")
                    .resizable()
                    .frame(width: 320, height: 180)
            
                Spacer()
                
                //Navigation Links to move to other views
                NavigationLink(destination: SimulationListView()){
                    Text("Simulation List")
                }
            NavigationLink(destination: SettingsView()){
                    Text("Settings")
                }
                Spacer()
                Spacer()
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

