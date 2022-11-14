//
//  Model.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import Foundation
import SpriteKit

//Creating a class which will hold the contents of the simulation
class SimScene: SKScene{
    
    //This method is used to start the moving parts of the simulation when the user presses a button.
    func commenceSimulation(massA: CGFloat, massB: CGFloat,velA: CGFloat, velB: CGFloat, collisionRestitution: CGFloat, ballAngle: CGFloat) -> Void{
        
        //creating instances of the ball class
        let ball_one = DynamicBall(ballRadius: 20, ballColor: .red, ballMass: massA, ballRestitution: collisionRestitution,ballPosition: CGPoint(x:100,y:75),gravityAffected: false, magnitude: 0)
        let ball_two = DynamicBall(ballRadius: 20, ballColor: .red, ballMass: massB, ballRestitution: collisionRestitution,ballPosition: CGPoint(x:240,y:75),gravityAffected: false, magnitude: 0)
    
        //adding the balls to the scene and giving them the necessary velocity vectors.
        addChild(ball_one.shape)
        addChild(ball_two.shape)
        
        ball_one.physics.velocity = CGVector(dx: velA * cos(ballAngle * .pi/180), dy: velA * sin(ballAngle * .pi/180))
        ball_one.physics.angularVelocity = CGFloat(0)
        ball_two.physics.velocity = CGVector(dx:-velB,dy: 0)

    }
    
    // function which clears the balls from the scene
    func clearSimulation(scene: SKScene)-> Void{
        scene.removeAllChildren()

    }
    
    override func didMove(to view: SKView) {
        self.scene?.scaleMode = .aspectFill
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.restitution = 1
    }
}
// This is class of all the parameters that can be modified in the simulation.
class SimParameters: ObservableObject{
    @Published var velBallOne: CGFloat = 0
    @Published var velBallTwo: CGFloat = 0
    @Published var Restitution: CGFloat = 0
    @Published var massBallOne: CGFloat = 0
    @Published var massBallTwo: CGFloat = 0
    @Published var BallOneAngle: CGFloat = 0
    
}
