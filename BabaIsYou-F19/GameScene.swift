//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var baba:SKSpriteNode!
    let SPEED: CGFloat = 25
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.baba = self.childNode(withName: "baba") as! SKSpriteNode
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mouseTouch = touches.first
               if (mouseTouch == nil) {
                        return
                    }
                let location = mouseTouch!.location(in: self)
        
                // WHAT NODE DID THE PLAYER TOUCH
                // ----------------------------------------------
               let nodeTouched = atPoint(location).name
        print("Player touched: \(String(describing: nodeTouched))")
        
        // GAME LOGIC: Move player based on touch
        if (nodeTouched == "up") {
            // move up
            self.baba.position.y = self.baba.position.y + SPEED
        }
        else if (nodeTouched == "down") {
            // move down
            self.baba.position.y = self.baba.position.y - SPEED
        }
        else if (nodeTouched == "right") {
            // move right
            self.baba.position.x = self.baba.position.x + SPEED
        }
        else if (nodeTouched == "left") {
            // move left
            self.baba.position.x = self.baba.position.x - SPEED
        }
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
