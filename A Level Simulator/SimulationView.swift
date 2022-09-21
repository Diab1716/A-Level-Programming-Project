//
//  SimulationView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import SwiftUI
import SpriteKit

struct SimulationView: View {
    
    var scene: SKScene {
        let scene = SimScene()
        scene.size = CGSize(width: 400, height: 400)
        scene.scaleMode = .fill
        scene.anchorPoint = CGPoint(x:0.5,y:0.5)
        return scene
    }
    
    
    var body: some View {
        VStack{
        SpriteView(scene: self.scene)
            .frame(width: 400, height: 400)
            .ignoresSafeArea()
        Spacer()
        }
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
