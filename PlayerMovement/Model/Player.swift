//
//  Player.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 03/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import SpriteKit

class Player: SKShapeNode {
    
    let hasRect = CGRect(x: 0, y: 0, width: 50, height: 50)
    
    // Object Property
    var velocity : CGFloat = 30
    var jumpForce: CGFloat = 50
    
    /// Init player
    ///
    /// - Parameter position: Optional position to set object in scene
    init(position: CGPoint? = CGPoint(x: 0, y: 0)){
        super.init()
        // Necessary to create a ShapeNode - Retangle
        self.path = UIBezierPath(roundedRect: hasRect, cornerRadius: 0).cgPath
        self.position = position!
        self.fillColor = UIColor.random()
        self.configurePhysicsBody()
    }
    
    /// Configure physics from player
    func configurePhysicsBody() {
        // Center is necessary because the scene is (0.5;0.5) = (x;y), so is necessary get center of object
        self.physicsBody = SKPhysicsBody(rectangleOf: self.hasRect.size, center: CGPoint(x: self.hasRect.width/2, y: self.hasRect.height/2))
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.friction = 0
        self.physicsBody!.restitution = 0
        self.physicsBody!.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Function called to move the player
    ///
    /// - Parameter dx: value of joystick side to move the object, necessary to know the side
    func move(inDirectionX dx: CGFloat) {
        let nodeDirection: CGFloat = dx < 0 ? -1.0 : 1.0
        self.physicsBody?.velocity.dx = 0.0
        self.physicsBody?.applyImpulse(CGVector(dx: (velocity*nodeDirection), dy: 0))
    }
    
    /// Action to jump player
    func jump(){
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.velocity.dy = 0
        self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpForce))
        self.physicsBody?.affectedByGravity = true
    }
    
    /// Remove velocity to idle player
    func idle(){
        self.physicsBody?.velocity.dx = 0
    }
}
