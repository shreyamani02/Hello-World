//
//  GameScene.swift
//  Minigame1
//
//  Created by RAGHU MANI on 8/10/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

//remove the shells with integers, but not those with doubles! Teaches students the difference of numerical datatypes!

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "background1")
    let mermaid = SKSpriteNode(imageNamed: "mermaid")
    
    let shell = SKSpriteNode(imageNamed: "shell")
    let cameraNode = SKCameraNode()

    
    override func didMove(to view: SKView) {
        addChild(background)
        mermaid.position = CGPoint(x:100, y:70)
        mermaid.size.height = 120
        mermaid.size.width = 120
        mermaid.zPosition = 3
        addChild(mermaid)
        createShells()
        
        // Get label node from scene and store it for use later
    }
    func createShells(){
        let shell = SKSpriteNode(imageNamed: "shell")
        var r = 100
        var t = 100
        for n in 1...45{
            var myShell = SKSpriteNode(imageNamed: "shell");
            myShell.size.height = 50
            myShell.size.width = 50
            // Set position of box dynamically
            var xCoord = Double.random(in: -300...300)
            var yCoord = Double.random(in: -300...300)
            
            var label = SKLabelNode(fontNamed: "Chalkduster")
            if n%5 == 1{
                var elementary = Double.random(in: -300...300)
                label.text = String(elementary)
                myShell.zPosition = 36
            }
            else{
                var elementary = Int.random(in: 1...300)
                label.text = String(elementary)
            }
            label.position = CGPoint(x: xCoord, y: yCoord)
            label.zPosition = 100
            label.fontSize = 12
            addChild(label)
            
            myShell.position = CGPoint(x: xCoord, y: yCoord)
            myShell.position = CGPoint(x: xCoord, y: yCoord)

            
            if n%2 == 1{
                r += 5
                t -= 10
            }
            else{
                r -= 10
                t += 3
            }
            // Name for easier use (may need to change if you have multiple rows generated)
            myShell.name = "shell"+String(n);
            print(myShell.name)
            myShell.zPosition = 56
            // Add box to scene
            addChild(myShell);
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self) //!
        let touchedNode = self.atPoint(positionInScene)
        
        

        if let name = touchedNode.name {
            let index = name.index(name.startIndex, offsetBy: 5)
            var nam = ""
            //Introduction Screen
            for n in 1...45{
                // Name for easier use (may need to change if you have multiple rows generated)
                nam = "shell"+String(n);
                if nam == name && touchedNode.zPosition != 36{
                    touchedNode.alpha = 0
                }
            }
            
        }
    }
    
}
