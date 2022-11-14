//
//  Path experiment.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 09/11/2022.
//

import Foundation
import SpriteKit

class TestPath: SKScene{
    var road = CustomPath()
    
    
    override func didMove(to view: SKView){
        road.physics.isDynamic = false
        addChild(road.shape)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
    }
    
    

    
}
