//
//  Ball.swift
//  BlappyFird
//
//  Created by Michal Lučanský on 23.2.17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import SpriteKit


class Ball: SKSpriteNode{

    private var nodeSize = CGSize(width: 5, height: 5)
    private var nodeColor = UIColor.red
    private var ballPosistion = CGPoint(x: 80, y:100)
    
    let ballCategoryMask : UInt32 = 0x1 << 2
    let ballCollisionMask : UInt32 = 0x1 << 1
    let ballContactMask : UInt32 = 0x1 << 1
    
    
    
    
    
    
    
    
    
    func createBall() -> SKSpriteNode {
        
        
        let ball = SKSpriteNode()
        
        ball.size = nodeSize
        ball.name = "ball"
        ball.position = ballPosistion
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ball.color = nodeColor
        
        
        ball.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: 5))
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.friction = 0
        ball.physicsBody?.angularDamping = 0.0
        ball.physicsBody?.linearDamping = 0.0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.categoryBitMask = ballCategoryMask
        ball.physicsBody?.collisionBitMask = ballCollisionMask
        ball.physicsBody?.contactTestBitMask = ballContactMask
        
        return ball
        
        
        
        
    }

    func moveBall(ball: SKSpriteNode){
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 0.1, dy: 0.1))
    
    
    
    }







}
