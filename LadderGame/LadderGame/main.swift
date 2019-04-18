//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameValue {
    let playerNumber:Int //readLine()
    let ladderHeight:Int //readLine()
    
    var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    lazy var ladders:[[Character]] =
        Array(repeating:Array(repeating: " ", count:ladderWidthLength), count: ladderHeight)
    
    var widthLadderNumber:Int {
        return Int(arc4random_uniform(UInt32(((playerNumber - 1) / 2) * ladderHeight)))
    }
    
    var heightCoordinate:Int {
        get{
            return Int(arc4random_uniform(UInt32(ladderHeight)))
        }
    }
    
    var widthCoordinate:Int {
        get{
            return (Int(arc4random_uniform(UInt32(playerNumber-1))) * 2) + 1
        }
    }
    
    mutating func addHeight(){
        for i in 0..<playerNumber{
            for j in 0..<ladderHeight{
                ladders[j][i*2] = "ㅣ"
            }
        }
    }
}
