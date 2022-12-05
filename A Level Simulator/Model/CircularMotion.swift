//
//  BlockOnRampModel.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 08/10/2022.
//

import Foundation
import SpriteKit


//class is an observable object to allow some parameters in the class to be modified
class CircularMotion: SKScene, ObservableObject{
    
    let ball = OrbitBall(radiusOrbit: 50, ballRadius: 5, ballColor: .red, ballMass: 5, ballRestitution: 0, ballPosition: CGPoint(x: 0, y: -170), gravityAffected: false, magnitude: 100)
    
    // Declaring variables for parameters that I want to be able to modify
    @Published var velMag: CGFloat = 50
    @Published var radiusOrbit: CGFloat = 50
    @Published var ballMass: CGFloat = 10
    
    let sceneCentre: CGPoint =  CGPoint(x:0,y:0)
    
    @Published var displayAngularPosition : CGFloat = 0
    var start: Bool = false
    
   //setting up the computed values
    var accellerationMagnitude: CGFloat{
        velMag.squared()/radiusOrbit
    }
    
    var forceMagnitude: CGFloat{
        accellerationMagnitude * ball.physics.mass
    }
    
    
    
    let centre=DynamicBall(ballRadius: 0.5, ballColor: .blue, ballMass: 1000, ballRestitution: 0, ballPosition: CGPoint(x: 0, y: 0), gravityAffected: false, magnitude: 0)
    
    let velocityArrow = ValueDisplay(imageName: "Arrow")
    let accellerationArrow = ValueDisplay(imageName: "Arrow")
    
    
    override func didMove(to view: SKView){
        
        addChild(ball.shape)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ball.orbitalRadius =  radiusOrbit
        ball.shape.position = CGPoint(x: 0, y: 0 - ball.orbitalRadius)
        
        start = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.start = true
        }
        ball.physics.angularVelocity = ball.velocityMagnitude/(ball.orbitalRadius*60)
            
            
            centre.addToScene(scene: self)
            addChild(velocityArrow.sprite)
            addChild(accellerationArrow.sprite)
       
    }
    
    //function responsible for checking and updating the orbital radius of the ball
    func updateOrbitalRadius(){
        if ball.orbitalRadius != radiusOrbit{
            ball.orbitalRadius = radiusOrbit
            ball.shape.position = CGPoint(x: sceneCentre.x + radiusOrbit * sin(ball.orbitalAngle), y: sceneCentre.y + radiusOrbit * -cos(ball.orbitalAngle))
           }
        }
    
    //function to update the length and position of an arrow
    func updateArrow(arrow: ValueDisplay, initialRotation: CGFloat, scale: CGFloat, magnitude: CGFloat){
        arrow.sprite.size.width = scale*magnitude
        arrow.sprite.position = ball.shape.position
        arrow.sprite.zRotation = ball.orbitalAngle + initialRotation
    }
    
    override func update(_ currentTime: TimeInterval){
        
        if start == true{
            
            //setting the attributes of the ball to the mass and velocity parameters in the view code
            ball.velocityMagnitude = velMag
            ball.physics.mass = ballMass
            
            self.updateArrow(arrow: velocityArrow, initialRotation: 0,scale: 0.5,magnitude: ball.velocityMagnitude)
            self.updateArrow(arrow: accellerationArrow, initialRotation: .pi/2, scale: 0.25,magnitude: self.accellerationMagnitude)
            
            self.updateOrbitalRadius()
            
            //Updating the velocity based on the on the angle the ball has rotated around the circle
            ball.physics.velocity = CGVector( dx: ball.velocityMagnitude * cos(ball.orbitalAngle), dy: ball.velocityMagnitude * sin(ball.orbitalAngle))
            
            //Calculating the angular velocity and from that the angular position of the ball
            ball.physics.angularVelocity = ball.velocityMagnitude/(ball.orbitalRadius * 60)
            ball.orbitalAngle = ball.orbitalAngle + ball.physics.angularVelocity
            
            //Updating the DisplayAngularPosition value, taking it mod 2pi to keep it between 0 and 2pi and converting it to degrees to make it more user interpretable
            displayAngularPosition = ball.orbitalAngle.truncatingRemainder(dividingBy: 2 * .pi) * 360/(2 * .pi)
        }
        
}
    
    
}
