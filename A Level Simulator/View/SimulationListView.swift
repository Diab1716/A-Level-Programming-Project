//
//  SettingsView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 05/10/2022.
//

import SwiftUI

struct SimulationListView: View {
    var body: some View {
        VStack{
            Text("Simulation List")
                .font(.largeTitle)
                .bold()
        
        ScrollView(){
            
            //One Module of the view which takes you to a specific simulation
            NavigationLink(destination: SimulationView()){
                HStack{
                Text("Ball Collision")
                Image("MenuImage")
                        .resizable()
                        .frame(width: 80, height: 45)
                    }
                }
            
            NavigationLink(destination: CircularMotionView()){
                HStack{
                Text("Friction Sim")
                Image("MenuImage")
                        .resizable()
                        .frame(width: 80, height: 45)
                    }
                }
            
            }
        }
    }
}

struct SimulationListView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationListView()
    }
}
