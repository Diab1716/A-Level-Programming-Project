//
//  GravitationalField.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/11/2022.
//

import Foundation
import SpriteKit

class GravitationalField: SKScene{
    let centreMass = DynamicBall(ballRadius: 50, ballColor: .blue, ballMass: 1000, ballRestitution: 0, ballPosition: CGPoint(x: 0, y: 0), gravityAffected: true, magnitude: 0)
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
        let field = SKFieldNode.customField{ (position: vector_float3, velocity: vector_float3, mass: Float, charge: Float, deltaTime: TimeInterval)  in
            return vector_float3(-10 * velocity.x, -velocity.y, 0)
        }
        field.strength = 3
        field.falloff = 0.8
        centreMass.addToScene(scene: self)
        centreMass.physics.isDynamic = false
        centreMass.shape.addChild(field)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = DynamicBall(ballRadius: 10, ballColor: .red, ballMass: 10, ballRestitution: 0, ballPosition: location, gravityAffected: true, magnitude: 0)
        ball.physics.velocity = CGVector(dx: 200, dy: 0)
        ball.addToScene(scene: self)
    }
}
