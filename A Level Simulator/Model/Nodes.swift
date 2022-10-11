//
//  Nodes.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 10/10/2022.
//

import Foundation
import SpriteKit


//creating a class for a generic ball class which has all its attributes that may be needed
class DynamicBall:SKNode{
    
    //physics attribute allows us to access all the physics properties, shape all the aesthetic properties of the ball,
    let physics: SKPhysicsBody
    let shape: SKShapeNode

    // constructor to declare all the properties of the ball
    init(ballRadius: CGFloat,ballColor: UIColor,ballMass: CGFloat,ballRestitution: CGFloat,ballPosition: CGPoint,gravityAffected: Bool){
        self.shape = SKShapeNode(circleOfRadius: ballRadius)
        self.physics = SKPhysicsBody(circleOfRadius: ballRadius)
        self.shape.physicsBody = physics
        
        self.shape.fillColor = ballColor
        self.shape.position = ballPosition
        
        
        self.physics.isDynamic = true
        self.physics.affectedByGravity = gravityAffected
        self.physics.linearDamping = 0
        self.physics.angularDamping = 0
        self.physics.allowsRotation = false
    
        
        
        self.physics.mass = ballMass
        self.physics.restitution = ballRestitution
        
        super.init()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
}

