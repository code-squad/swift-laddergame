//
//  LadderGame.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}


struct LadderGame {
    var numberOfPerson:Int = 0
    var heightOfLadder:Int = 0
    var ladderMatrix = [[String]]()
    let printer:Input = Input()
    let scanner:Output = Output()
    
//    mutating func start(){
//        printer.askNumberOfPerson()
//        numberOfPerson = scanner.userInputValue()
//        printer.askNUmberOfLadder()
//        heightOfLadder = scanner.userInputValue()
//        initLadderMatrix()
//        makeLadder()
//        printer.printLadder(ladderMatrix)
//    }
    
    mutating func makeLadder(){
        let numberOfLadder = ( numberOfPerson + heightOfLadder ) / 2
        for _ in 0..<numberOfLadder{
            ladderMatrix[heightOfLadder.arc4random][(numberOfPerson-1).arc4random] = "-|"
        }
    }
    
    mutating func initLadderMatrix(){
        ladderMatrix = Array(repeating: Array(repeating: " |", count: numberOfPerson-1), count: heightOfLadder)
    }
}
