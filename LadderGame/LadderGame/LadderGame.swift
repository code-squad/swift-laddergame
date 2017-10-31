//
//  LadderGame.swift
//  LadderGame
//
//  Created by Mrlee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    let horizLine: Bool = true // "-"
    let spaceLine: Bool = false // " "
    var components: [Bool] = [true]
    var frames: [[Bool]] = [[true]]
    var columnNumber: Int = 0
    var rowNumber: Int = 0
    var names: String = ""
    private var horizontalFlag: Bool = true
    
    init(){}
    
    mutating func makeLadder(_ gameInfo: GameInfo){
        guard let wrapNames = gameInfo.names  else {
            return
        }
        names = wrapNames
        columnNumber = (gameInfo.columnNumber - 1)
        rowNumber = gameInfo.rowNumber
        components = [Bool](repeating: horizLine, count: columnNumber)
        frames = [[Bool]](repeating: components, count: rowNumber)
        makeRandomLine()
    }
    
    private mutating func makeRandomLine(){
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
        (horizontalFlag && randomValue) ?
        (horizontalFlag = makeHrozLine(outerArrayIndex, innerArrayIndex)) :
        (horizontalFlag = makeSpaceLine(outerArrayIndex, innerArrayIndex))
    }
    
    private mutating func makeHrozLine(_ outerArrayIndex: Int, _ innerArrayIndex: Int) -> Bool{
        frames[outerArrayIndex][innerArrayIndex] = horizLine
        return false
    }
    
    private mutating func makeSpaceLine(_ outerArrayIndex: Int, _ innerArrayIndex: Int) -> Bool{
        frames[outerArrayIndex][innerArrayIndex] = spaceLine
        return true
    }
}

