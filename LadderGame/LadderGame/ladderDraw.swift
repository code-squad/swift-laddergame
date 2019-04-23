//
//  ladderDraw.swift
//  LadderGame
//
//  Created by 이희찬 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct drawingladder {
    let empty:Character = " "
    let full:Character = "-"
    //세로 사다리 추가
    func drawingHeight(playerNumber:Int,ladderHeight:Int,ladders:[[Character]])->[[Character]]{
        var ladders = ladders
        for i in 0..<playerNumber{
            for j in 0..<ladderHeight{
                ladders[j][i*2] = "ㅣ"
            }
        }
        return ladders
    }
    //가로 사다리 추
    func randomCoordinates(ladderHeight:Int,playerNumber:Int) -> Array<Int> {
        let height = Int(arc4random_uniform(UInt32(ladderHeight)))
        let width = (Int(arc4random_uniform(UInt32(playerNumber-1))) * 2) + 1
        return [height,width]
    }
    
    func isEmpty(ladders:[[Character]],coordinates:Array<Int>) -> Character {
        let ladders = ladders
        guard ladders[coordinates[0]][coordinates[1]] == empty else {
            return full
        }
        return empty
    }
    
    func checkRight (ladders:[[Character]],coordinates:Array<Int>) -> Character {
        var coordinates = coordinates
        coordinates[1] = coordinates[1] + 2
        return isEmpty(ladders: ladders, coordinates: coordinates)
    }
    
    func checkLeft (ladders:[[Character]],coordinates:Array<Int>) -> Character {
        var coordinates = coordinates
        coordinates[1] = coordinates[1] - 2
        return isEmpty(ladders: ladders, coordinates: coordinates)
    }
    
    func checkRightLeft(ladders:[[Character]],coordinates:Array<Int>) -> Character {
        let right = checkRight(ladders: ladders, coordinates: coordinates)
        let left = checkLeft(ladders: ladders, coordinates: coordinates)
        guard right == empty && left == empty else{
            return full
        }
        return empty
    }
    
    
    func isContinue(ladders:[[Character]],coordinates:Array<Int>,ladderWidthLength:Int) -> Character {
        switch coordinates[1] {
        case 1:
            return checkRight(ladders: ladders, coordinates: coordinates)
        case ladderWidthLength - 2 :
            return checkLeft(ladders: ladders, coordinates: coordinates)
        default:
            return checkRightLeft(ladders: ladders, coordinates: coordinates)
        }
    }
    
    func shouldReturnCoordinate(ladders:[[Character]],ladderHeight:Int,playerNumber:Int) -> Array<Int> {
        let coordinates = randomCoordinates(ladderHeight:ladderHeight, playerNumber:playerNumber)
        guard isEmpty(ladders: ladders, coordinates: coordinates) == empty else {
            return shouldReturnCoordinate(ladders:ladders,ladderHeight:ladderHeight,playerNumber:playerNumber)
        }
        return coordinates
    }
    
    func canMarking(ladders:[[Character]],ladderWidthLength:Int,ladderHeight:Int,playerNumber:Int) -> Array<Int> {
        let coordinates = shouldReturnCoordinate(ladders: ladders, ladderHeight: ladderHeight, playerNumber: playerNumber)
        guard isContinue(ladders: ladders, coordinates: coordinates, ladderWidthLength: ladderWidthLength) == empty else {
            return canMarking(ladders: ladders, ladderWidthLength: ladderWidthLength, ladderHeight: ladderHeight, playerNumber: playerNumber)
        }
        return coordinates
    }
    
    func marking(ladders:[[Character]],coordinates:Array<Int>) -> [[Character]] {
        var ladders = ladders
        ladders[coordinates[0]][coordinates[1]] = "-"
        return ladders
    }
    
    func drawingWidth(widthLadderNumber:Int,ladders:[[Character]],ladderHeight:Int,playerNumber:Int,ladderWidthLength:Int) -> [[Character]] {
        var ladders = ladders
        var index = 0
        let ladderNum = ladderWidthLength
        while index < ladderNum {
            let coordinates = canMarking(ladders: ladders, ladderWidthLength: ladderWidthLength, ladderHeight: ladderHeight, playerNumber: playerNumber)
            ladders = marking(ladders: ladders, coordinates: coordinates)
            index += 1
        }
        return ladders
    }
}

struct drawing {
    func playDraw(ladder:LadderGameBasicValue) -> [[Character]] {
        let ladderDraw = drawingladder()
        var ladder = ladder
        var ladders = ladder.ladders
        ladders = ladderDraw.drawingHeight(playerNumber: ladder.playerNumber, ladderHeight: ladder.ladderHeight, ladders: ladders)
        ladders = ladderDraw.drawingWidth(widthLadderNumber: ladder.widthLadderNumber, ladders: ladders, ladderHeight: ladder.ladderHeight, playerNumber: ladder.playerNumber, ladderWidthLength: ladder.ladderWidthLength)
        return ladders
    }
}
