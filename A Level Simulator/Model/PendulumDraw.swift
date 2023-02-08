//
//  Pendulum Draw.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 23/11/2022.
//

import Foundation
import SpriteKit
import SwiftUI

class Pendulum:SKScene ,ObservableObject{
    @Published var overallFrequency: CGFloat = 0
    let root = PendulumNode(ballRadius: 5, ballColor: .red, ballMass: 0, ballRestitution: 0, ballPosition: CGPoint(x: 0, y: 75), gravityAffected: false, magnitude: 0,nodeBefore: nil)
    var previousNode:PendulumNode? = nil
    var currentNode:PendulumNode? = nil
    var count = 0
    
    
    override func didMove(to view: SKView) {
        root.physics.isDynamic = false
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        root.addToScene(scene: self)
        previousNode = nil
        currentNode = root
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let subNode = PendulumNode(ballRadius: 5, ballColor: .red, ballMass: 0, ballRestitution: 0, ballPosition: location, gravityAffected: true, magnitude: 0, nodeBefore: previousNode)
        
        let joint = SKPhysicsJointSpring.joint(withBodyA: currentNode!.physics, bodyB: subNode.physics, anchorA: currentNode!.shape.position, anchorB: subNode.shape.position)
        joint.damping = 0
        joint.frequency = overallFrequency
        joint.bodyA.friction = 0
        joint.bodyB.friction = 0
        joint.bodyB.linearDamping = 0
        joint.bodyA.linearDamping = 0
        self.addChild(subNode.shape)
        self.physicsWorld.add(joint)
        currentNode = subNode
        previousNode = currentNode
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        let marker = SKShapeNode(circleOfRadius: 2)
            marker.fillColor = .blue
            marker.position = currentNode!.shape.position
            addChild(marker)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            marker.removeFromParent()
        }
        
    }
    func removePreviousNode(){
        currentNode?.shape.removeFromParent()
        currentNode = currentNode?.previousNode
        
    }

}
