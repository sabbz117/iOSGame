//
//  GameScene.swift
//  Nimble Ninja
//
//  Created by Salvador Peralta on 10/23/16.
//  Copyright © 2016 Salvador Peralta. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var movingGround = SPMovingGround(size: CGSize(width: 0, height: 0))
    var hero = SPHero()
    var monving = true
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255, alpha: 1.0)
        
        movingGround  = SPMovingGround(size: CGSize(width: view.frame.width, height: 20))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height/2)
        
        addChild(movingGround)
        
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        
        movingGround.start()
        hero.breathe()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
        if(monving)
        {
            hero.reset()
            hero.stop()
            
            movingGround.reset()
            movingGround.stop()
            monving = false
        }
        else{
            hero.breathe()
            movingGround.start()
            monving = true
        }
        
    }
}
