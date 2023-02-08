//
//  GravitationalField.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 14/11/2022.
//

import Foundation
import SpriteKit



class GravitationalField: SKScene{
    let centreMass = DynamicBall(ballRadius: 10, ballColor: .blue, ballMass: 1000000000, ballRestitution: 0, ballPosition: CGPoint(x: -0, y: 0), gravityAffected: true, magnitude: 0)
    //let centreMassTwo = DynamicBall(ballRadius: 10, ballColor: .blue, ballMass: 1000000000, ballRestitution: 0, ballPosition: CGPoint(x: 50, y: 0), gravityAffected: true, magnitude: 0)
    
    var touchArray: [CGPoint] = []
    var ballArray: [DynamicBall] = []
    var currentArrow: ValueDisplay? = nil
    var touching: Bool = false
    
    func calculateBallVelocity(startPosition: CGPoint,endPosition: CGPoint)-> CGVector{
        let yVel = startPosition.y - endPosition.y
        let xVel = startPosition.x - endPosition.x
        return CGVector(dx: xVel, dy: yVel)
    }
    
    override func didMove(to view: SKView) {
        
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
        let field = SKFieldNode.radialGravityField()
        field.strength = 1
        field.falloff = 2
        
        
        //let fieldTwo = SKFieldNode.radialGravityField()
        //fieldTwo.strength = 1
        //fieldTwo.falloff = 2
       
        
        centreMass.addToScene(scene: self)
        centreMass.physics.isDynamic = false
        centreMass.shape.addChild(field)
        //centreMassTwo.addToScene(scene: self)
        //centreMassTwo.physics.isDynamic = false
        //centreMassTwo.shape.addChild(fieldTwo)
        
        for i in -8...8{
            for j in -8...8{
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
        touching = true
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = DynamicBall(ballRadius: 5, ballColor: .red, ballMass: 100, ballRestitution: 0, ballPosition: location, gravityAffected: true, magnitude: 0)
        
        let velocityArrow = ValueDisplay(imageName: "Arrow")
        velocityArrow.sprite.size.width = 0
        velocityArrow.sprite.anchorPoint = CGPoint(x: 0.05, y: 0.5)
        
        ball.addToScene(scene: self)
        ball.physics.isDynamic = false
        ball.shape.addChild(velocityArrow.sprite)
        
        ballArray.append(ball)
        touchArray.append(location)
        currentArrow = velocityArrow
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let ballVelocity = calculateBallVelocity(startPosition: location, endPosition: (touchArray.last)!)
        //let yVel = location.y - touchArray.last!.y
        //let xVel = location.x - touchArray.last!.x
        ballArray.last?.physics.isDynamic = true
        ballArray.last?.physics.velocity = ballVelocity
        currentArrow?.sprite.removeFromParent()
        touching = false
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        for ball in ballArray{
            if ball.physics.velocity == CGVector(dx: 0, dy: 0) && touching == false{
                ball.shape.removeFromParent()
            }
        }
    }

}




