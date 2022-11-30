//
//  GravitationalField.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/11/2022.
//

import Foundation
import SpriteKit

class GravitationalField: SKScene{
    let centreMass = DynamicBall(ballRadius: 10, ballColor: .blue, ballMass: 1000000000, ballRestitution: 0, ballPosition: CGPoint(x: 0, y: 0), gravityAffected: true, magnitude: 0)
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
        let field = SKFieldNode.radialGravityField()
        field.strength = 1
        field.falloff = 2
        centreMass.addToScene(scene: self)
        centreMass.physics.isDynamic = false
        centreMass.shape.addChild(field)
        
        for i in -5...5{
            for j in -5...5{
                let arrow = ValueDisplay(imageName: "Arrow")
                arrow.sprite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                arrow.sprite.position = CGPoint(x: 30*i, y: 30*j)
                arrow.sprite.size.height = 10
                arrow.sprite.size.width = 25000 * CGFloat(field.strength)/(arrow.sprite.position.x.squared()+arrow.sprite.position.y.squared())
                arrow.sprite.zRotation =  .pi + atan2(arrow.sprite.position.y,arrow.sprite.position.x)
               
                print(i,j)
                self.addChild(arrow.sprite)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = DynamicBall(ballRadius: 2, ballColor: .red, ballMass: 10, ballRestitution: 0, ballPosition: location, gravityAffected: true, magnitude: 0)
        ball.physics.velocity = CGVector(dx: 200, dy: 0)
        ball.addToScene(scene: self)
    }
}
