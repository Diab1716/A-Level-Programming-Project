//
//  Model.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import Foundation
import SpriteKit
import SwiftUI

class SimScene: SKScene, ObservableObject {
    
    override func didMove(to view: SKView){
        
        let ball_one = SKShapeNode(circleOfRadius: 20)
        let ball_two = SKShapeNode(circleOfRadius: 20)
        let ground = SKShapeNode(rectOf: CGSize( width: 400,height: 10))
        
        ball_one.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball_two.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 400,height: 10))
        
        ball_one.fillColor = .red
        ball_two.fillColor = .blue
        ground.fillColor = .green
        
        ball_one.position = CGPoint(x: -100, y: 0)
        ball_two.position = CGPoint(x: 100, y: 0)
        ground.position = CGPoint(x: 0, y: -22)
        
        ball_one.physicsBody?.affectedByGravity = false
        ball_two.physicsBody?.affectedByGravity = false
        ground.physicsBody?.isDynamic = false
        
        ball_one.physicsBody?.mass = 1
        ball_two.physicsBody?.mass = 1
        
        addChild(ball_one)
        addChild(ball_two)
        addChild(ground)
        
        ball_one.physicsBody?.velocity = CGVector(dx: 50,dy: 0)
        ball_one.physicsBody?.restitution = 1
        ball_one.physicsBody?.linearDamping = 0
        
        ball_two.physicsBody?.velocity = CGVector(dx: -50,dy: 0)
        ball_two.physicsBody?.restitution = 1
        ball_two.physicsBody?.linearDamping = 0
        
    }
}

