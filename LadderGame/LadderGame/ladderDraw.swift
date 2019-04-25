//
//  ladderDraw.swift
//  LadderGame
//
//  Created by 이희찬 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Draw {
    let playerNumber:Int //readLine()
    let ladderHeight:Int //readLine()
    
    var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    var widthLadderNumber:Int {
        return Int.random (in: 1...(playerNumber - 1) / 2 * ladderHeight)
    }
    
    lazy var markLadders:[[Bool]] = Array(repeating:Array(repeating: false, count:playerNumber-1), count:ladderHeight)
    lazy var drawLadders:[[Character]] = Array(repeating:Array(repeating: " ", count:ladderWidthLength), count:ladderHeight)
    
    func randomCoordinates() -> (Int,Int) {
        let height = Int.random(in: 0..<ladderHeight)
        let width = Int.random(in: 0..<playerNumber - 1)
        return (height,width)
    }
    
    var (x,y) = (0,0)
    
    mutating func isEmpty() -> Bool {
        guard markLadders[x][y] == false else {
            return false
        }
        return true
    }
    
    mutating func rightIsEmpty() -> Bool {
        guard markLadders[x][y+1] == false else {
            return false
        }
        return true
    }
    
    mutating func leftIsEmpty() -> Bool {
        guard markLadders[x][y-1] == false else {
            return false
        }
        return true
    }
    
    mutating func rightLeftIsEmpty() -> Bool {
        let right = rightIsEmpty()
        let left = leftIsEmpty()
        guard right && left else {
            return false
        }
        return true
    }
    
    mutating func isContinue() -> Bool {
        switch y {
        case 0:
            return rightIsEmpty()
        case playerNumber-2:
            return leftIsEmpty()
        default:
            return rightLeftIsEmpty()
        }
    }
    
    mutating func findEmptyCoordinate() -> (Int,Int) {
        repeat {
            (x,y) = randomCoordinates()
        }
            while isEmpty() == false
        return (x,y)
    }
    
    mutating func checkNotContinueCoordinate() -> Bool {
        findEmptyCoordinate()
        guard isContinue() else{
            return false
        }
        return true
    }
    
    mutating func findNotContinueCoordinate() -> (Int,Int) {
        var NotContinueCoordinate : Bool
        repeat {
            NotContinueCoordinate = checkNotContinueCoordinate()
        }
            while NotContinueCoordinate == false
        return (x,y)
    }
    
    mutating func mark() -> [[Bool]] {
        markLadders[x][y] = true
        return markLadders
    }
    
    mutating func markWidth() {
        findNotContinueCoordinate()
        mark()
    }
    
    mutating func markWidthAsmuchWidthLadderNumber() -> [[Bool]] {
        var index = 0
        let ladderNumber = widthLadderNumber
        while index < ladderNumber {
            markWidth()
            index += 1
        }
        return markLadders
    }
    
    mutating func loopOfPlayerNumberForHeight(_ i : Int) {
        for j in 0..<playerNumber{
            drawLadders[i][j*2] = "ㅣ"
        }
    }
    
    mutating func allHeightLadderDraw() {
        for i in 0..<ladderHeight {
            loopOfPlayerNumberForHeight(i)
        }
    }
    
    mutating func drawWidthLadder(_ i:Int, _ j:Int) {
        if markLadders[i][j] == true {
            drawLadders[i][j*2+1] = "-"
        }
    }
    
    mutating func loopOfPlayerNumberForWidth(_ i : Int) {
        for j in 0..<playerNumber-1{
            drawWidthLadder(i,j)
        }
    }
    
    mutating func allWidthLadderDraw() {
        for i in 0..<ladderHeight {
            loopOfPlayerNumberForWidth(i)
        }
    }
    
    init (_ player:Int, _ ladderHeight:Int){
        self.playerNumber = player
        self.ladderHeight = ladderHeight
    }
}


