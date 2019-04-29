//
//  ladderDraw.swift
//  LadderGame
//
//  Created by 이희찬 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ladderBoard {
    let playerNumber:Int //readLine()
    let ladderHeight:Int //readLine()
    
    var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    var widthLadderNumber:Int {
        return Int.random (in: 1...(playerNumber - 1) / 2 * ladderHeight)
    }
    
    lazy var widthLadderIsExistence:[[Bool]] = Array(repeating:Array(repeating: false, count:playerNumber-1), count:ladderHeight)
    lazy var Ladders:[[Character]] = Array(repeating:Array(repeating: " ", count:ladderWidthLength), count:ladderHeight)
    
    func createRandomCoordinates() -> (Int,Int) {
        let height = Int.random(in: 0..<ladderHeight)
        let width = Int.random(in: 0..<playerNumber - 1)
        return (height,width)
    }
    
    var (x,y) = (0,0)
    
    mutating func isEmpty(_ x:Int,_ y:Int) -> Bool {
        guard widthLadderIsExistence[x][y] == false else {
            return false
        }
        return true
    }
    
    mutating func isContinue() -> Bool {
        switch y {
        case 0:
            return isEmpty(x, y+1)
        case playerNumber-2:
            return isEmpty(x, y-1)
        default:
            return isEmpty(x, y+1) && isEmpty(x, y-1)
        }
    }
    
    mutating func findEmptyCoordinate(){
        repeat {
            (x,y) = createRandomCoordinates()
        }
            while isEmpty(x,y) == false
    }
    
    mutating func mark(){
        widthLadderIsExistence[x][y] = true
    }
    
    mutating func findCorrectCoordinate() {
        var isCorrectCoordinate:Bool
        repeat{
            (x,y) = createRandomCoordinates()
            let isEmpty = self.isEmpty(x,y)
            let isContinue = self.isContinue()
            isCorrectCoordinate = (isEmpty && isContinue)
        } while isCorrectCoordinate == false
    }
    
    mutating func markAsmuchWidthLadderNumber(){
        var index = 0
        let ladderNumber = widthLadderNumber
        while index < ladderNumber {
            findCorrectCoordinate()
            mark()
            index += 1
        }
    }
    
    mutating func loopOfPlayerNumberForHeight(_ i : Int) {
        for j in 0..<playerNumber{
            Ladders[i][j*2] = "ㅣ"
        }
    }
    
    mutating func allHeightLadderDraw() {
        for i in 0..<ladderHeight {
            loopOfPlayerNumberForHeight(i)
        }
    }
    
    mutating func drawWidthLadder(_ i:Int, _ j:Int) {
        if widthLadderIsExistence[i][j] == true {
            Ladders[i][j*2+1] = "-"
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


