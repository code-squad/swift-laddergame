//
//  ResultView.swift
//  LadderGame
//
//  Created by jack on 2017. 12. 4..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//
//결과를 출력하는 구조체
import Foundation

struct ResultView {
    
    func generateString (_ length : Int, char : Character) -> String {
        var temp = ""
        for _ in 0...length {
            temp += String(char)
        }
        return temp
    }
    
    func drawOneHorizontalFloor (oneFloorOfLadder : [Bool], repeatNum : Int) -> [String] {
        let bar = generateString(repeatNum, char: "-")
        let empty = generateString(repeatNum, char: " ")
        var temp : [String] = Array(repeatElement("", count: oneFloorOfLadder.count))
        for index in 0..<oneFloorOfLadder.count {
            if oneFloorOfLadder[index] == false {
                temp[index] = empty
                continue
            }
            temp[index] = bar
        }
        return temp
    }
    func drawHorizontalLines (randomLadder : [[Bool]], playerNum : Int) -> [[String]] {
        var ladderWithHorizontalLines = Array(repeatElement([""], count: randomLadder.count))
        for index in 0..<randomLadder.count {
            ladderWithHorizontalLines[index] = drawOneHorizontalFloor(oneFloorOfLadder: randomLadder[index], repeatNum: playerNum)
        }
        return ladderWithHorizontalLines
    }

    func drawVerticalLines (_ ladderWithHorizontalLine : [String]) {
        print("  |" + ladderWithHorizontalLine[0], terminator: "")
        for indexOfBlock in 1..<ladderWithHorizontalLine.count {
            print("|" + ladderWithHorizontalLine[indexOfBlock], terminator: "")
        }
        print("|")
    }

    func printCompleteLadder (ladderSet : [[String]], players : [String]) {
        var playerNames = " "
        for indexOfHeight in 0..<ladderSet.count {
            drawVerticalLines(ladderSet[indexOfHeight])
        }
        for indexOfPlayers in 0..<players.count {
            playerNames += players[indexOfPlayers] + " "
        }
        print(playerNames)
    }
    
}
