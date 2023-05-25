//
//  Trash.swift
//  Trash
//
//  Created by Irvan P. Saragi on 24/05/23.
//

import SpriteKit

enum TrashType: String {
    case red, blue, yellow, gray
}

class Trash: SKSpriteNode {
    let trashType = SKSpriteNode(imageNamed: "botol")
    var grabbed = false
    var flying = false{
        didSet{
            if flying{
                physicsBody?.isDynamic = true
            }
        }
    }
    
    
}

