//
//  GameViewController.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 03/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene: GameScene!
    var skView: SKView!
    
    public override func viewDidLoad() {
        self.skView = SKView(frame: self.view.frame)
        
        self.view.addSubview(self.skView)
        NSLayoutConstraint.activate([
            self.skView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.skView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.skView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.skView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            ])
        
        self.scene = GameScene(size: skView.frame.size)
        self.scene.scaleMode = .resizeFill
        self.scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        self.skView.presentScene(self.scene)
    }
    
    public override func viewDidLayoutSubviews() {
        self.skView.frame = self.view.frame
    }
}
