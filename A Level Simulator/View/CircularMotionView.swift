//
//  BlockOnPlaneView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 10/10/2022.
//

import SwiftUI
import SpriteKit

struct CircularMotionView: View {
    @StateObject var circularMotionScene = CircularMotion(size: CGSize(width: 340, height: 340))
    
   
    
    
    var body: some View {
        VStack(){
        //Text Views which display the values of certain things in the simulation
        Text("Centripetal Accelleration: \(circularMotionScene.accellerationMagnitude, specifier: "%.1f")")
            
        Text("   Centripetal Force: \(circularMotionScene.forceMagnitude, specifier: "%.1f")")
            
        Text("   Angular Position: \(circularMotionScene.displayAngularPosition, specifier: "%.0f")")
        
            
            SpriteView(scene: self.circularMotionScene)
                .frame(width: 340, height: 340)
                .ignoresSafeArea()
            
            //Sliders allowing the user to change the values of the velocity radius and mass of the ball
            HStack{
            Text("Tangential Velocity")
                    .foregroundColor(.black)
                Slider(value: $circularMotionScene.velMag, in: 5...100)
                Text("\(circularMotionScene.velMag, specifier: "%.1f")")
                }
            
            HStack{
            Text("Orbit Radius")
                    .foregroundColor(.black)
                Slider(value: $circularMotionScene.radiusOrbit, in: 50...150)
                Text("\(circularMotionScene.radiusOrbit, specifier: "%.0f")")
                }
            HStack{
            Text("Ball Mass")
                    .foregroundColor(.black)
                Slider(value: $circularMotionScene.ballMass, in: 1...50)
                Text("\(circularMotionScene.ballMass, specifier: "%.0f")")
                }
            
        }
}

struct CircularMotionView_Previews: PreviewProvider {
    static var previews: some View {
        CircularMotionView()
        }
    }
}
