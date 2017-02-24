//
//  InterfaceController.swift
//  Pong Extension
//
//  Created by Michal Lučanský on 24.2.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController,WKCrownDelegate {

    @IBOutlet var scene: WKInterfaceSKScene!
    @IBOutlet var scoreLabel: WKInterfaceLabel!

    
    let skScene = GameScene(size: WKInterfaceDevice.current().screenBounds.size)
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        skScene.backgroundColor = UIColor.black
        scene.presentScene(skScene)
        scene.preferredFramesPerSecond = 60
        
        skScene.childNode(withName: "player")?.position = CGPoint(x: skScene.frame.width - 10, y: 100)
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        crownSequencer.delegate = self
        crownSequencer.focus()
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    private func padleMoveRestriction(){
    
    let maxY = skScene.frame.size.height - 40
    let minY = CGFloat(35)
        if  (skScene.childNode(withName: "player")?.position.y)! > maxY{
             skScene.childNode(withName: "player")?.position.y = maxY
        }else if  (skScene.childNode(withName: "player")?.position.y)! < minY{
         skScene.childNode(withName: "player")?.position.y = minY
        }
        
        if  (skScene.childNode(withName: "enemy")?.position.y)! > maxY{
            skScene.childNode(withName: "enemy")?.position.y = maxY
        }else if  (skScene.childNode(withName: "enemy")?.position.y)! < minY{
            skScene.childNode(withName: "enemy")?.position.y = minY
        }
        
    
    }
    
    
     func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        updateScoreLabel()
        if rotationalDelta > 0{
        padleMoveRestriction()
            skScene.childNode(withName: "player")?.position.y = (skScene.childNode(withName: "player")?.position.y)! + 10
            
        }else if rotationalDelta < 0{
            padleMoveRestriction()
            skScene.childNode(withName: "player")?.position.y = (skScene.childNode(withName: "player")?.position.y)! - 10
            
        }
        
    }
    
    private func scoreCheck(){
        if skScene.gameOverStatus == true {
       
        pushController(withName: "GameOver", context: nil)
        }
    }
    
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        scoreCheck()
        updateScoreLabel()
    }
   
    private func updateScoreLabel(){
    
    scoreLabel.setText("\(skScene.enemyScore) : \(skScene.playerScore)")
    
    }
    
    


}
