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
    var ladderColNumber: Int = 0
    var ladderRowNumber: Int = 0
    var ladderHorizflag: Bool = true
    
    mutating func makeLadder(_ col: Int, _ row: Int){
        ladderColNumber = (col - 1) + col
        ladderRowNumber = row
        ladderComponents = [String](repeating: vertiLine, count: ladderColNumber)
        ladderFrames = [[String]](repeating: ladderComponents, count: ladderRowNumber)
    }
    
    mutating func makeRandomLine(){
        for seqOfOutArr in 0..<ladderRowNumber {
            makeRandomInLine(seqOfOutArr)
        }
    }
    
    private mutating func makeRandomInLine(_ seqOfOutArr: Int){
        for seqOfInArr in 0..<ladderColNumber {
            let randomVal: Bool = arc4random_uniform(2) % 2 == 0 ? true : false
            chooseToMakeLine(seqOfOutArr ,seqOfInArr, randomVal)
        }
    }
    
    private mutating func chooseToMakeLine(_ seqOfOutArr: Int ,_ seqOfInArr: Int, _ randomVal: Bool){
        if seqOfInArr % 2 != 0 { (ladderHorizflag && randomVal) ?
            (ladderHorizflag = makeHrozLine(seqOfOutArr, seqOfInArr)) :
            (ladderHorizflag = makeSpaceLine(seqOfOutArr, seqOfInArr)) }
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
        for seqOfOutArr in 0..<ladderRowNumber {
            printLadderInner(seqOfOutArr)
            print()
        }
    }
    
    private func printLadderInner(_ seqOfOutArr: Int){
        for seqOfInArr in 0..<ladderColNumber {
            print("\(ladderFrames[seqOfOutArr][seqOfInArr])", terminator: "")
        }
    }
}
