//
//  phisicyCategory.swift
//  Trash
//
//  Created by Irvan P. Saragi on 24/05/23.
//
import CoreGraphics

struct physicsCategory{
    static let none : UInt32 = 0
    static let all : UInt32 = UInt32.max
    static let edge : UInt32 = 0x1
    static let trash : UInt32 = 0x1 << 1
    static let block : UInt32 = 0x1 << 2
}
