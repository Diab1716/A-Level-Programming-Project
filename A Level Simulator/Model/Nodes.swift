//
//  Nodes.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 10/10/2022.
//

import Foundation
import SpriteKit



//creating a class for a generic ball class which has all its attributes that may be needed
class DynamicBall{
    
    //physics attribute allows us to access all the physics properties, shape all the aesthetic properties of the ball,
    let physics: SKPhysicsBody
    let shape: SKShapeNode
    var velocityMagnitude: CGFloat


    // constructor to declare all the properties of the ball
    init(ballRadius: CGFloat,ballColor: UIColor,ballMass: CGFloat,ballRestitution: CGFloat,ballPosition: CGPoint,gravityAffected: Bool,magnitude: CGFloat){
        self.velocityMagnitude = magnitude
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
        self.physics.usesPreciseCollisionDetection = true
    
        
        
        self.physics.mass = ballMass
        self.physics.restitution = ballRestitution
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
    func addToScene(scene:SKScene){
        scene.addChild(self.shape)
    }
    
}


class OrbitBall: DynamicBall, ObservableObject{
    
    @Published var orbitalRadius: CGFloat
    @Published var orbitalAngle: Double
    
    init(radiusOrbit: Double,ballRadius: CGFloat,ballColor: UIColor,ballMass: CGFloat,ballRestitution: CGFloat,ballPosition: CGPoint,gravityAffected: Bool,magnitude: CGFloat){
        
        self.orbitalAngle = 0
        self.orbitalRadius = radiusOrbit
        
        // initialising the attributes of the superclass DynamicBall
        super.init(ballRadius: ballRadius, ballColor: ballColor, ballMass: ballMass, ballRestitution: ballRestitution, ballPosition: ballPosition, gravityAffected: gravityAffected, magnitude: magnitude)
        }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

    // This is a class to allow me to place images, specifically arrows into scenes
class ValueDisplay{
    let sprite: SKSpriteNode
    let image: String
    
    init(imageName: String){
        self.image = imageName
        self.sprite = SKSpriteNode(imageNamed: imageName)
        self.sprite.anchorPoint = CGPoint(x: 0.1, y: 0.5)
        self.sprite.size.height = 15
        
    }
    
}

class CustomPath{
    let shape: SKShapeNode
    let physics: SKPhysicsBody
    var point: CGPoint = CGPoint(x: 0, y: 0)
    var points: [CGPoint] = []
    var y: CGFloat = 0
    var x: CGFloat = 0
        
    init(){
        for i in -250...250{
            self.y = sin(CGFloat(i))
            self.x = CGFloat(i)
            self.point = CGPoint(x: x,y: y)
            self.points.append(point)
        }
    
        self.shape = SKShapeNode(splinePoints: &points, count: points.count)
        self.physics = SKPhysicsBody()
        self.shape.physicsBody = physics
    }
}
