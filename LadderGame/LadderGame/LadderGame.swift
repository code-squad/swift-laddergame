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
        for seqOfOutArr in 0..<rowNumber {
            makeRandomInLine(seqOfOutArr)
        }
    }
    
    private mutating func makeRandomInLine(_ seqOfOutArr: Int){
        for seqOfInArr in 0..<columnNumber {
            let randomVal: Bool = arc4random_uniform(2) % 2 == 0 ? true : false
            chooseToMakeLine(seqOfOutArr ,seqOfInArr, randomVal)
        }
    }
    
    private mutating func chooseToMakeLine(_ seqOfOutArr: Int ,_ seqOfInArr: Int, _ randomVal: Bool){
        if seqOfInArr % 2 != 0 { (horizontalFlag && randomVal) ?
            (horizontalFlag = makeHrozLine(seqOfOutArr, seqOfInArr)) :
            (horizontalFlag = makeSpaceLine(seqOfOutArr, seqOfInArr)) }
    }
    
    private mutating func makeHrozLine(_ seqOfOutArr: Int, _ seqOfInArr: Int) -> Bool{
        ladderFrames[seqOfOutArr][seqOfInArr] = horizLine
        return false
    }
    
    private mutating func makeSpaceLine(_ seqOfOutArr: Int, _ seqOfInArr: Int) -> Bool{
        ladderFrames[seqOfOutArr][seqOfInArr] = spaceLine
        return true
    }
    
    func printLadder(){
        for seqOfOutArr in 0..<rowNumber {
            printLadderInner(seqOfOutArr)
            print()
        }
    }
    
    private func printLadderInner(_ seqOfOutArr: Int){
        for seqOfInArr in 0..<columnNumber {
            print("\(ladderFrames[seqOfOutArr][seqOfInArr])", terminator: "")
        }
    }
}
