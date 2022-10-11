//
//  SimulationView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import SwiftUI
import SpriteKit

struct SimulationView: View {
    //Creating an instance of the parameter class
    @StateObject var parameters = SimParameters()

    
    //Creating scene with the desired dimensions
    var scene = SimScene(size: CGSize(width: 340, height: 200))

    
    
    var body: some View {
        VStack{
            //Button to start the simulation
            Button{
                scene.commenceSimulation(massA: parameters.massBallOne, massB: parameters.massBallTwo, velA: parameters.velBallOne, velB: parameters.velBallTwo, collisionRestitution: parameters.Restitution, ballAngle: parameters.BallOneAngle)}label: {
                    Text("Start Simulation")
                }
            
            Button{
                scene.clearSimulation(scene: scene)}label: {
                    Text("Clear Simulation")
                }
            
            SpriteView(scene: self.scene)
                .frame(width: 340, height: 200)
                .ignoresSafeArea()
            
            // Creating sliders to modify each one of the parameters.
            HStack{
            Text("Ball 1 Velocity")
                    .foregroundColor(.black)
                Slider(value: $parameters.velBallOne, in: 0...100)
                Text("\(parameters.velBallOne, specifier: "%.1f")")
                }
            
            HStack{
            Text("Ball 1 Angle")
                    .foregroundColor(.black)
                Slider(value: $parameters.BallOneAngle, in: -90...90)
                Text("\(parameters.BallOneAngle, specifier: "%.0f")")
                }
            
            
            HStack{
            Text("Ball 2 Velocity")
                    .foregroundColor(.black)
                Slider(value: $parameters.velBallTwo, in: 0...100)
                Text("\(parameters.velBallTwo, specifier: "%.1f")")
                }
            
            
            HStack{
            Text("Ball 1 Mass     ")
                    .foregroundColor(.black)
                Slider(value: $parameters.massBallOne, in: 0...100)
                Text("\(parameters.massBallOne, specifier: "%.0f")")
                }
           
            
            HStack{
            Text("Ball 2 Mass    ")
                    .foregroundColor(.black)
                Slider(value: $parameters.massBallTwo, in: 0...100)
                Text("\(parameters.massBallTwo, specifier: "%.0f")")
                }
            
            
            HStack{
            Text("Restitution     ")
                    .foregroundColor(.black)
                Slider(value: $parameters.Restitution, in: 0...1)
                Text("\(parameters.Restitution, specifier: "%.1f")")
              }
            
            }
        
        }
}


struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
