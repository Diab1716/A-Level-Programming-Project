//
//  Model.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import Foundation
import SpriteKit

class SimScene: SKScene{
    
    
    func createBall(ballRadius: CGFloat,ballColor: UIColor, ballPosition:CGPoint,gravity:Bool,ballMass: CGFloat,ballRestitution: CGFloat,ballDamping: CGFloat) -> SKShapeNode{
        let ball = SKShapeNode(circleOfRadius: ballRadius)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
        ball.fillColor = ballColor
        ball.position = ballPosition
        ball.physicsBody?.affectedByGravity = gravity
        ball.physicsBody?.mass = ballMass
        ball.physicsBody?.restitution = ballRestitution
        ball.physicsBody?.linearDamping = ballDamping
        return ball
    }
    
    override func didMove(to view: SKView){
    
        let ball_one = createBall(ballRadius: 20, ballColor: .red, ballPosition: CGPoint(x:-100,y:0), gravity: false, ballMass: 1, ballRestitution: 1, ballDamping: 0)
        let ball_two = createBall(ballRadius: 20, ballColor: .blue, ballPosition: CGPoint(x:100,y:0), gravity: false, ballMass: 1, ballRestitution: 1, ballDamping: 0)
        let ground = SKShapeNode(rectOf: CGSize( width: 400,height: 10))
        ground.fillColor = .green
        ground.strokeColor = .green
        ground.position = CGPoint(x:0,y:-22)
        
        addChild(ball_one)
        addChild(ball_two)
        addChild(ground)
        
        ball_one.physicsBody?.velocity = CGVector(dx: 50,dy: 0)
        
        ball_two.physicsBody?.velocity = CGVector(dx: -50,dy: 0)
        
    }
}

class SimParameters: ObservableObject{
    var velBallOne: Double = 0
    var velBallTwo: Double = 0
    var Restitution: Double = 0
    var massBallOne: Double = 0
    var massBallTwo: Double = 0
    var startSim: Bool = false
    
    func startSimulation()->Void{
        startSim = true
    }
}
