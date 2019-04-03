//
//  GameSceneView.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 03/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation
import SpriteKit

enum Side{
    case up
    case down
    case right
    case left
}

extension GameScene{
    func setupHorizontalSafe(type: Side) -> SKShapeNode?{
        var y: CGFloat = 0.0
        switch type {
        case .up:
            y = self.size.height/2
        case .down:
            y = -self.size.height/2
        default:
            return nil
        }
        let area = SKShapeNode(rect: CGRect(x: -self.size.width/2, y: y, width: self.size.width, height: 1))
        let startPoint = CGPoint(x: -self.size.width/2, y: y)
        let endPoint = CGPoint(x: self.size.width, y: y)
        area.physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        area.physicsBody?.restitution = 0
        area.physicsBody?.friction = 1
        return area
    }
}
