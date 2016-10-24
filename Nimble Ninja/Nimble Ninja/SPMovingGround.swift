//
//  SPMovingGround.swift
//  Nimble Ninja
//
//  Created by Salvador Peralta on 10/23/16.
//  Copyright © 2016 Salvador Peralta. All rights reserved.
//

import Foundation
import SpriteKit

class SPMovingGround: SKSpriteNode{
    
    let MOVING_SEGMENTS = 20
    let COLOR_ONE = UIColor(red: 88.0/255.0, green: 140.0/255.0, blue: 87.00/255.0, alpha: 1.0)
    let COlOR_TWO = UIColor(red: 120.0/255.0, green: 195.0/255.0, blue: 118.0/255.0, alpha: 1.0)

    init(size: CGSize){
        super.init(texture:nil, color:UIColor.brown, size: CGSize(width: size.width * 2, height: size.height))
        
        anchorPoint = CGPoint(x: 0, y: 0.5)
        
        for i in (0..<MOVING_SEGMENTS)
        {
            var segmentColor: UIColor!
            
            if i % 2 == 0
            {
                segmentColor = COLOR_ONE
            }
            else
            {
                segmentColor = COlOR_TWO
            }
            
            let segment = SKSpriteNode(color:segmentColor, size: CGSize(width: self.size.width / CGFloat(MOVING_SEGMENTS), height: self.size.height))
            segment.anchorPoint = CGPoint(x: 0, y: 0.5)
            segment.position = CGPoint(x: CGFloat(i)*segment.size.width, y: 0)
            
            addChild(segment)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start(){
        let moveLeft = SKAction.moveBy(x: -frame.size.width/2, y: 0, duration: 1.0)
        let resetPosition = SKAction.moveTo(x: 0, duration: 0)
        
        let movingSequence = SKAction.sequence([moveLeft,resetPosition])
        run(SKAction.repeatForever(movingSequence))
        
    }
    
    func reset(){
        run(SKAction.moveTo(x: 0, duration: 0))
    }
   
    func stop(){
        removeAllActions()
        
    }

}
