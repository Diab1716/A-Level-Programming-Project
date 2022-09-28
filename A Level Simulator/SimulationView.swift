//
//  SimulationView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import SwiftUI
import SpriteKit

struct SimulationView: View {
    @StateObject var parameters = SimParameters()

    
    var scene: SKScene {
        let scene = SimScene()
        
        scene.size = CGSize(width: 400, height: 150)
        scene.scaleMode = .fill
        scene.anchorPoint = CGPoint(x:0.5,y:0.5)
        return scene
    }
    
    
    var body: some View {
        VStack{
            Button("Start Simulation", action: parameters.startSimulation)
                .foregroundColor(.red)
            
            SpriteView(scene: self.scene)
                .frame(width: 400, height: 150)
                .ignoresSafeArea()
            
            HStack{
            Text("Ball 1 Velocity")
                    .foregroundColor(.black)
                Slider(value: $parameters.velBallOne, in: 0...100)
                Text("\(parameters.velBallOne, specifier: "%.2f")")
                }
            
            
            HStack{
            Text("Ball 2 Velocity")
                    .foregroundColor(.black)
                Slider(value: $parameters.velBallTwo, in: 0...100)
                Text("\(parameters.velBallTwo, specifier: "%.2f")")
                }
            
            
            HStack{
            Text("Ball 1 Mass     ")
                    .foregroundColor(.black)
                Slider(value: $parameters.massBallOne, in: 0...100)
                Text("\(parameters.massBallOne, specifier: "%.2f")")
                }
           
            
            HStack{
            Text("Ball 2 Mass    ")
                    .foregroundColor(.black)
                Slider(value: $parameters.massBallTwo, in: 0...100)
                Text("\(parameters.massBallTwo, specifier: "%.2f")")
                }
            
            
            HStack{
            Text("Restitution     ")
                    .foregroundColor(.black)
                Slider(value: $parameters.Restitution, in: 0...1)
                Text("\(parameters.Restitution, specifier: "%.2f")")
              }
            
            }
        
        }
}


struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
