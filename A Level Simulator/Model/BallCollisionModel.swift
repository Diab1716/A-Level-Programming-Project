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
    
    
    // This is a function which can create a ball with various parameters and return it to me for use.
    func createBall(ballRadius: CGFloat,ballColor: UIColor, ballPosition:CGPoint,gravity:Bool,ballMass: CGFloat,ballRestitution: CGFloat,ballDamping: CGFloat) -> SKShapeNode{
        let ball = SKShapeNode(circleOfRadius: ballRadius)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
        ball.fillColor = ballColor
        ball.position = ballPosition
        ball.physicsBody?.affectedByGravity = gravity
        ball.physicsBody?.mass = ballMass
        ball.physicsBody?.restitution = ballRestitution
        ball.physicsBody?.linearDamping = ballDamping
        ball.name = "ball"
        return ball
    }
    
    //This method is used to start the moving parts of the simulation when the user presses a button.
    func commenceSimulation(massA: CGFloat, massB: CGFloat,velA: CGFloat, velB: CGFloat, collisionRestitution: CGFloat) -> Void{
        
        //uisng the ball function to create the two balls in the simulation
        let ball_one = createBall(ballRadius: 20, ballColor: .red, ballPosition: CGPoint(x:100,y:75), gravity: false, ballMass: massA, ballRestitution: collisionRestitution, ballDamping: 0)
        let ball_two = createBall(ballRadius: 20, ballColor: .blue, ballPosition: CGPoint(x:300,y:75), gravity: false, ballMass: massB, ballRestitution: collisionRestitution, ballDamping: 0)
        
        //adding the balls to the scene and giving them the necessary velocity vectors.
        addChild(ball_one)
        addChild(ball_two)
        
        ball_one.physicsBody?.velocity = CGVector(dx: velA, dy: 0)
        ball_two.physicsBody?.velocity = CGVector(dx:-velB,dy: 0)

    }
    
    // function which clears the balls from the scene
    func clearSimulation(scene: SKScene)-> Void{
        scene.removeAllChildren()
        
        //rebuilding the ground in the scene.
        let ground = SKShapeNode(rectOf: CGSize( width: 400,height: 200))
        ground.fillColor = .gray
        ground.strokeColor = .gray
        ground.position = CGPoint(x:200,y:100)
        addChild(ground)
        
    }
    
    // didMove is responisble for things that happen immediately when the simulation view is loaded
    override func didMove(to view: SKView){
    
        // Adding an aesthetic ground to the scene
        let ground = SKShapeNode(rectOf: CGSize( width: 400,height: 200))
        ground.fillColor = .gray
        ground.strokeColor = .gray
        ground.position = CGPoint(x:200,y:100)
        
        addChild(ground)
        
    }
}


// This is class of all the parameters that can be modified in the simulation.
class SimParameters: ObservableObject{
    @Published var velBallOne: CGFloat = 0
    @Published var velBallTwo: CGFloat = 0
    @Published var Restitution: CGFloat = 0
    @Published var massBallOne: CGFloat = 0
    @Published var massBallTwo: CGFloat = 0
    
}
