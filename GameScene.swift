//
//  GameScene.swift
//  BlappyFird
//
//  Created by Steve Sparks on 6/18/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//
import Foundation
import SpriteKit
import WatchKit

class GameScene: SKScene {
    
    private let player = Padle()
    private let enemy = Padle()
    private let ball = Ball()

    
    var gameOverStatus = false
    var playerScore = 0
    var enemyScore = 0
    
    override func sceneDidLoad() {
        
        let ballNode = ball.createBall()
        let playerNode = player.playerNode(position: CGPoint())
        let enemyNode = enemy.enemyNode()
        
        addChild(playerNode)
        addChild(enemyNode)
        addChild(ballNode)
        
        let border = SKPhysicsBody(edgeLoopFrom: frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        ball.moveBall(ball: ballNode)
    
    }

    
    
    private func checkPointStatus(playerWhoWon: SKSpriteNode){
        
        let ball = childNode(withName: "ball") as! SKSpriteNode
        ball.position = CGPoint(x: 80, y: 100)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        
        
        if playerWhoWon == childNode(withName: "player") {
            playerScore += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 0.1, dy: 0.1))
            
            
            
        }
        if playerWhoWon == childNode(withName: "enemy") {
            enemyScore += 1
            
             ball.physicsBody?.applyImpulse(CGVector(dx: -0.1, dy: 0.1))
            
            
            
        }
        
        
    }
    
    
   
    
     private func whoGotThePoin(){
        
        let enemy = childNode(withName: "enemy") as? SKSpriteNode
        let player = childNode(withName: "player") as? SKSpriteNode
        let ball = childNode(withName: "ball") as? SKSpriteNode
        
        if (ball?.position.x)! > (player?.position.x)!{
            checkPointStatus(playerWhoWon: enemy! )
            
        }else if (ball?.position.x)! < (enemy?.position.x)!{
            checkPointStatus(playerWhoWon: player!)
        }

    }
   
    private func gameOver(){
    
        if playerScore == 10 || enemyScore == 10{
        
        gameOverStatus = true
        playerScore = 0
        enemyScore = 0
         
    
        
        
        }
    
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        gameOver()
        
        enemy.moveEnemy(enemy: childNode(withName: "enemy") as! SKSpriteNode, ballPosition: (childNode(withName: "ball")?.position.y)!)
        
        whoGotThePoin()
        
    
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
}
