//
//  GameScene.swift
//  sheCreatesProject
//
//  Created by RAGHU MANI on 8/5/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import SpriteKit
import GameplayKit

class island: SKScene {
    
    
    override func didMove(to view: SKView) {
        sceneTransition()
    }
    func sceneTransition(){
        var transition:SKTransition = SKTransition.fade(withDuration: 8)
        var scene:SKScene = island(size: self.size)
        //scene.position = CGPoint(x:0,y:660)
        self.view?.presentScene(scene, transition: transition)

    }
    
}
