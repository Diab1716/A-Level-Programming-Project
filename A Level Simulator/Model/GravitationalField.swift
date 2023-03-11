//
//  GravitationalField.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/11/2022.
//

import Foundation
import SpriteKit

//Simulaiton which allows users to place objects in a gravitaitonal field

class GravitationalField: SKScene{
    
    // creating the object at the centre of the simulation
    let centreMass = DynamicBall(ballRadius: 10, ballColor: .blue, ballMass: 1000000000, ballRestitution: 0, ballPosition: CGPoint(x: -0, y: 0), gravityAffected: true, magnitude: 0)
    
    
    // Declaring variables
    var touchArray: [CGPoint] = []
    var ballArray: [DynamicBall] = []
    var currentArrow: ValueDisplay? = nil
    var touching: Bool = false

    
  func calculateBallVelocity(startPosition: CGPoint,endPosition: CGPoint)-> CGVector{
        let yVel = startPosition.y - endPosition.y
        let xVel = startPosition.x - endPosition.x
        return CGVector(dx: xVel, dy: yVel)
    
    }
    
    // Upon moving to view
    override func didMove(to view: SKView) {
    
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
        
        // Creaitng the redial field
        let field = SKFieldNode.radialGravityField()
        field.strength = 1
        field.falloff = 2
        
        //Adding the centre and field to the scene
        centreMass.addToScene(scene: self)
        centreMass.physics.isDynamic = false
        centreMass.shape.addChild(field)
        
        
        //Creating the arrows showing the direction and strength of the field
        for i in -8...8{
            for j in -8...8{
                let arrow = ValueDisplay(imageName: "Arrow")
                arrow.sprite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                arrow.sprite.position = CGPoint(x: 30*i, y: 30*j)
                arrow.sprite.size.height = 10
                arrow.sprite.size.width = 30000 * CGFloat(field.strength)/(arrow.sprite.position.x.squared()+arrow.sprite.position.y.squared())
                arrow.sprite.zRotation =  .pi + atan2(arrow.sprite.position.y,arrow.sprite.position.x)
               
                self.addChild(arrow.sprite)
            }
        }
        
    }
    
    //Updates performed when user presses on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // obtaining location of touch
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
       
        //creating ball at location of touch
        let ball = DynamicBall(ballRadius: 5, ballColor: .red, ballMass: 100, ballRestitution: 0, ballPosition: location, gravityAffected: true, magnitude: 0)
        ball.addToScene(scene: self)
        ball.physics.isDynamic = false
        
        //storing touch location and ball in arrays for use in touchesMoved and touchesEnded
        touchArray.append(location)
        ballArray.append(ball)
        
        //Creating the arrow which will show how far the user has dragged
        let velocityArrow = ValueDisplay(imageName: "Arrow")
        velocityArrow.sprite.size.width = 0
        velocityArrow.sprite.anchorPoint = CGPoint(x: 0.05, y: 0.5)
        ball.shape.addChild(velocityArrow.sprite)
        currentArrow = velocityArrow
        
        
         touching = true
    }
    
   //Updates performd when the user lets go
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        //Calling the function to calculate how fast the ball should go based on how far the user dragged
        let ballVelocity = calculateBallVelocity(startPosition: location, endPosition: touchArray.last!)
     
        //accessing the last ball added to the ball array
        ballArray.last?.physics.isDynamic = true
        ballArray.last?.physics.velocity = ballVelocity
        
        currentArrow?.sprite.removeFromParent()
        
        touching = false
        
        
    }
    //Updates performed when the user drags
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Calculating how long the velocity arrow should be and updating accordingly
        for touch in touches{
            let location = touch.location(in: self)
            let xDistance =  location.x - touchArray.last!.x
            let yDistance =  location.y - touchArray.last!.y
            
            let arrowLength = sqrt(xDistance.squared()+yDistance.squared())
            let arrowRotation = atan2(yDistance,xDistance)
            
            currentArrow!.sprite.size.width = arrowLength
            currentArrow!.sprite.zRotation = arrowRotation
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //Checking and removing any stationary balls.
        for ball in ballArray{
            if ball.physics.velocity == CGVector(dx: 0, dy: 0) && touching == false{
                ball.shape.removeFromParent()
            }
        }
    }

}





