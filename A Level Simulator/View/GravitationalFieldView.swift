//
//  Test.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 09/11/2022.
//

import SwiftUI
import SpriteKit

struct GravitationalFieldView: View {
    var fieldSim: SKScene{
        let scene = GravitationalField(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        //let scene = FieldGenerator(size: CGSize(width: 1600, height: 1600))
        return scene
    }
    
    
    var body: some View {
        VStack{
            
            Text("Gravitational Field. Click and drag to add an orbiting object.")
        
        SpriteView(scene: fieldSim)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}

struct GravitatationalFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GravitationalFieldView()
    }
}
