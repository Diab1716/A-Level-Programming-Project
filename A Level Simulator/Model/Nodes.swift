//
//  Nodes.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 10/10/2022.
//

import Foundation
import SpriteKit

class Ball{
    let physicsBody: SKPhysicsBody
    let shape: SKShapeNode

    init(ballRadius: CGFloat){
        self.shape = SKShapeNode(circleOfRadius: ballRadius)
        self.shape.fillColor = ballColor
        self.shape.position = CGPoint(x:0,y:0)
        
    
    }
    
}
