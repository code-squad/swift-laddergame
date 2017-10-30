//
//  LadderGame.swift
//  LadderGame
//
//  Created by Mrlee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var ladderInfo: LadderInfo = LadderInfo()
    var horizontalFlag: Bool = true
    
    mutating func makeLadder(column: Int, row: Int){
        ladderInfo.columnNumber = (column - 1) + column
        ladderInfo.rowNumber = row
        ladderInfo.components = [String](repeating: ladderInfo.vertiLine, count: ladderInfo.columnNumber)
        ladderInfo.frames = [[String]](repeating: ladderInfo.components, count: ladderInfo.rowNumber)
    }
    mutating func makeRandomLine(){
        for outerArrayIndex in 0..<ladderInfo.rowNumber {
            makeRandomInLine(outerArrayIndex)
        }
    }
    private mutating func makeRandomInLine(_ outerArrayIndex: Int){
        for innerArrayIndex in 0..<ladderInfo.columnNumber {
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
        ladderInfo.frames[outerArrayIndex][innerArrayIndex] = ladderInfo.horizLine
        return false
    }
    private mutating func makeSpaceLine(_ outerArrayIndex: Int, _ innerArrayIndex: Int) -> Bool{
        ladderInfo.frames[outerArrayIndex][innerArrayIndex] = ladderInfo.spaceLine
        return true
    }
}

