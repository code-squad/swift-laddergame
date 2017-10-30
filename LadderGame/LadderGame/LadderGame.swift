//
//  LadderGame.swift
//  LadderGame
//
//  Created by Mrlee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    let horizLine: String = "-"
    let vertiLine: String = "|"
    let spaceLine: String = " "
    var ladderComponents: [String] = [""]
    var ladderFrames: [[String]] = [[""]]
    var columnNumber: Int = 0
    var rowNumber: Int = 0
    var horizontalFlag: Bool = true
    
    mutating func makeLadder(_ col: Int, _ row: Int){
        columnNumber = (col - 1) + col
        rowNumber = row
        ladderComponents = [String](repeating: vertiLine, count: columnNumber)
        ladderFrames = [[String]](repeating: ladderComponents, count: rowNumber)
    }
    
    mutating func makeRandomLine(){
        for outerArrayIndex in 0..<rowNumber {
            makeRandomInLine(outerArrayIndex)
        }
    }
    
    private mutating func makeRandomInLine(_ outerArrayIndex: Int){
        for innerArrayIndex in 0..<columnNumber {
            let randomValue: Bool = arc4random_uniform(2) % 2 == 0 ? true : false
            chooseToMakeLine(outerArrayIndex ,innerArrayIndex, randomValue)
        }
    }
    
    private mutating func chooseToMakeLine(_ outerArrayIndex: Int ,_ innerArrayIndex: Int, _ randomValue: Bool){
        if innerArrayIndex % 2 != 0 { (horizontalFlag && randomValue) ?
            (horizontalFlag = makeHrozLine(outerArrayIndex, innerArrayIndex)) :
            (horizontalFlag = makeSpaceLine(outerArrayIndex, innerArrayIndex)) }
    }
    
    private mutating func makeHrozLine(_ outerArrayIndex: Int, _ innerArrayIndex: Int) -> Bool{
        ladderFrames[outerArrayIndex][innerArrayIndex] = horizLine
        return false
    }
    
    private mutating func makeSpaceLine(_ outerArrayIndex: Int, _ innerArrayIndex: Int) -> Bool{
        ladderFrames[outerArrayIndex][innerArrayIndex] = spaceLine
        return true
    }
    
    func printLadder(){
        for outerArrayIndex in 0..<rowNumber {
            printLadderInner(outerArrayIndex)
            print()
        }
    }
    
    private func printLadderInner(_ outerArrayIndex: Int){
        for innerArrayIndex in 0..<columnNumber {
            print("\(ladderFrames[outerArrayIndex][innerArrayIndex])", terminator: "")
        }
    }
}
