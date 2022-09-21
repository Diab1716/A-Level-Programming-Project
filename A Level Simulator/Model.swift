//
//  Model.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import Foundation
import SpriteKit

class SimScene: SKScene {
    
    override func didMove(to view: SKView){
        
        let ball_one = SKShapeNode(circleOfRadius: 5)
        let ball_two = SKShapeNode(circleOfRadius: 5)
        
        ball_one.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball_two.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        
        ball_one.position = CGPoint(x: -400, y: 0)
        ball_two.position = CGPoint(x: 50, y: 0)
        
        ball_one.physicsBody?.affectedByGravity = false
        ball_two.physicsBody?.affectedByGravity = false
        
        ball_one.physicsBody?.mass = 1
        addChild(ball_one)
        ball_one.physicsBody?.velocity = CGVector(dx: 0,dy: 0)
        ball_one.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 0))
    }
}





