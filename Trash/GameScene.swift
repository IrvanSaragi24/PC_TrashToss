//
//  GameScene.swift
//  Trash
//
//  Created by Irvan P. Saragi on 23/05/23.
//

import SpriteKit

enum roundState{
    case ready, flying, finished, animating
}

class GameScene : SKScene {
    
    var mapNode = SKTileMapNode()
    

    var panRecogGesture = UIPanGestureRecognizer()
    var pinchRecognizer = UIPinchGestureRecognizer()
    var maxScale : CGFloat = 0
    let background = SKSpriteNode(imageNamed: "Back")
    let trashscan = SKSpriteNode(imageNamed: "trashcan")
    let trashBotol = Trash().trashType
    let trash = Trash()
    let anchor = SKNode()
    var roundstate = roundState.ready
    var isfinished = false
    
    var scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    var count = 0 {
        didSet{
            scoreLabel.text = "Trash: \(count)"
        }
    }
  
    
    
    override func didMove(to view: SKView) {
        
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        background.position = CGPoint(x: size.width/2, y: size.height/2.15)
        background.zPosition = 1
        background.setScale(0.22)
        addChild(background)
        
        trashscan.position = CGPoint(x: size.width/1.2, y: size.height/4)
        trashscan.zPosition = 9
        trashscan.setScale(0.1)
        addChild(trashscan)
        
        trashBotol.position = CGPoint(x: size.width/10, y: size.height/4)
        trashBotol.zPosition = 10
        trashBotol.setScale(0.05)
        trashBotol.physicsBody?.friction = 0
        trashBotol.physicsBody?.restitution = 1
        trashBotol.physicsBody?.linearDamping = 0
        trashBotol.physicsBody?.angularDamping = 0
        trashBotol.physicsBody?.allowsRotation = true
        trashBotol.physicsBody = SKPhysicsBody(rectangleOf: trashBotol.size)
        trashBotol.physicsBody?.categoryBitMask = physicsCategory.trash
        trashBotol.physicsBody?.contactTestBitMask = physicsCategory.all
        trashBotol.physicsBody?.collisionBitMask = physicsCategory.block | physicsCategory.edge
        trashBotol.physicsBody?.isDynamic = false
        addChild(trashBotol)
        
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.position = CGPoint(x: 300, y: 300)
        scoreLabel.zPosition = 20
        scoreLabel.fontColor = .gray
        count = 0
        addChild(scoreLabel)
        
        
        let frame = SKPhysicsBody(edgeLoopFrom: self.frame)
        frame.friction = 0
        self.physicsBody = frame
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if(location.x <= 150){
                trashBotol.position.x = location.x
                trashBotol.position.y = location.y
            }
           
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if(location.x <= 150){
                trashBotol.physicsBody?.isDynamic = true
                trashBotol.physicsBody?.affectedByGravity = false
                trashBotol.physicsBody?.applyImpulse(CGVector(dx: .random(in: 10...20), dy: .random(in: 10...20) ))
                trashBotol.isUserInteractionEnabled = false
            } }
        
        
        
    }
    
    override func didSimulatePhysics() {
        guard let physicsBody = trashBotol.physicsBody else {return}
        if roundstate == .flying && physicsBody.isResting{
            trashBotol.removeFromParent()
            roundstate = .finished
        }
    }
    
    func constransToAnchor(active : Bool){
        if active {
            let slingRange = SKRange(lowerLimit: 0.0, upperLimit: trash.size.width*3)
            let positionConstraint  = SKConstraint.distance(slingRange, to: anchor)
            trash.constraints = [positionConstraint]
        }
        else{
            trash.constraints?.removeAll()
        }
    }
    
    func constraintpoint(active : Bool){
        if active {
            let slingRange = SKRange(lowerLimit: 0.0, upperLimit: trashBotol.size.width*1)
            let positionConstraint  = SKConstraint.distance(slingRange, to: trashBotol.position)
            trashBotol.constraints = [positionConstraint]
        }
        else{
            trashBotol.constraints?.removeAll()
        }    }
    
    
    override func update(_ currentTime: TimeInterval) {

        let min_x_target = trashscan.position.x - trashscan.size.width/2
        let max_x_target = trashscan.position.x + trashscan.size.width/2
        let min_y_target = trashscan.position.y - trashscan.size.height/2
        let max_y_target = trashscan.position.y + trashscan.size.height/2
       
        
        if trashBotol.position.x >= min_x_target && max_x_target >= trashBotol.position.x && trashBotol.position.y >= min_y_target && max_y_target >= trashBotol.position.y  {
            trashBotol.position = CGPoint(x: size.width/10, y: size.height/4)
            trashBotol.zPosition = 5
            count += 1
            print(count)
        }
        
        if count == 5{
            isfinished = true
            count += 1
        }
        if isfinished == true{
            scoreLabel.text = "COMPLETED"
            scoreLabel.fontSize = 50
            scoreLabel.position = CGPoint(x: size.width/2, y: size.height/2)
            scoreLabel.fontColor = .darkText
            trashBotol.removeFromParent()
            trashscan.removeFromParent()
            isfinished = false
        }
        
        
    }
    
//    func gameOver() {
//        if isfinished{
//            // Stop any ongoing actions or animations
//            removeAllActions()
//            // Disable user interaction
//            isUserInteractionEnabled = false
//            // Remove all nodes from the scene
//            removeAllChildren()
//        }
//
//
//
//
//
//        // Present a game over screen or perform any other necessary tasks
//        // ...
//    }
    
}
