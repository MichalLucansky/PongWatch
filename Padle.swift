//
//  Padle.swift
//  BlappyFird
//
//  Created by Michal Lučanský on 23.2.17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import SpriteKit



class Padle : SKSpriteNode{


    
    private let nodeColor = UIColor.white
    private let enemyPosition = CGPoint(x: 10, y: 100)
    
    private let playerCategoryMask : UInt32 = 0x1 << 1
    private let playerCollisionMask : UInt32 = 0x1 << 2
    private let playerContactMask : UInt32 = 0x1 << 2
        
        
        
        
    
    
    
    
    
    func playerNode(position: CGPoint) -> SKSpriteNode{
        
        
        let player = SKSpriteNode()
        
        player.size = CGSize(width: 5, height: 40)
        player.name = "player"
        player.position = position
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.color = UIColor.white
        
        
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: 40))
        player.physicsBody?.isDynamic = false
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.friction = 0
        player.physicsBody?.restitution = 0
        player.physicsBody?.angularDamping = 0.0
        player.physicsBody?.linearDamping = 0.0
        player.physicsBody?.categoryBitMask = playerCategoryMask
        player.physicsBody?.collisionBitMask = playerCollisionMask
        player.physicsBody?.contactTestBitMask = playerContactMask
        
        return player
        
       
        
        }
    
    func enemyNode()  -> SKSpriteNode{
        
        
        let enemy = SKSpriteNode()
        
        enemy.size = CGSize(width: 5, height: 40)
        enemy.name = "enemy"
        enemy.position = enemyPosition
        enemy.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        enemy.color = UIColor.white
        
        
        enemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: 40))
        enemy.physicsBody?.isDynamic = false
        enemy.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.friction = 0
        enemy.physicsBody?.restitution = 0
        enemy.physicsBody?.angularDamping = 0.0
        enemy.physicsBody?.linearDamping = 0.0
        enemy.physicsBody?.categoryBitMask = playerCategoryMask
        enemy.physicsBody?.collisionBitMask = playerCollisionMask
        enemy.physicsBody?.contactTestBitMask = playerContactMask
        
        return enemy
        
        
    }
    
    func moveEnemy(enemy: SKSpriteNode, ballPosition: CGFloat){
        
        
    enemy.run(SKAction.moveTo(y: ballPosition, duration: 0.2))
    
    
    }

    
    

 






}
