//
//  letsJustStart.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 07/12/2022.
//

import Foundation
import SpriteKit
import SwiftUI

class FieldGenerator: SKScene{
    
    let field = SKFieldNode.customField {
        (position:vector_float3, velocity: vector_float3, mass: Float, charge: Float, deltaTime: TimeInterval) in
        return vector_float3(Float(Double.random(in: -1...1)),Float(Double.random(in: -1...0.75)),0)
    }
    
   
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(field)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //guard let touch = touches.first else { return }
        //let location = touch.location(in: self)
        //let ball = DynamicBall(ballRadius: 5, ballColor: .red, ballMass: 0, ballRestitution: 1, ballPosition: location, gravityAffected: true, magnitude: 0)
        //addChild(ball.shape)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
       
        let location = CGPoint(x: CGFloat(Double.random(in: -400...400)), y: CGFloat(Double.random(in: -400...400)))
        let ball = DynamicBall(ballRadius: 2, ballColor: .red, ballMass: 0, ballRestitution: 1, ballPosition: location, gravityAffected: true, magnitude: 0)
        addChild(ball.shape)
        DispatchQueue.main.asyncAfter(deadline: .now() + 25){
            ball.shape.removeFromParent()
        }
        
    }
    
    
    
}
