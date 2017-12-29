//
//  main.swift
//  LadderGame
//
//  Created by JINA on 2017. 12. 21..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

// 참여인원 입력 받기
func getPlayer() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let player = readLine()
    return Int(player ?? "") ?? 0
}

// 사다리 높이 입력 받기
func getLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = readLine()
    return Int(ladderHeight ?? "") ?? 0
}

// 사다리 발판 준비
func preparadeToMakeFootBoard(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
    var arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)

    for raw in 0 ..< ladderHeight {
        for col in 0 ..< player - 1 {
            let random = arc4random_uniform(2)
            if random == 0 {
                arrLadder[raw][col] = !arrLadder[raw][col]
            }
        }
    }
    return arrLadder
}

// 사다리 발판 만들기

// 발판 요소
enum LadderFootBoardElements: String {
    case hasFootBoard = "-"
    case noFootBoard = " "
}

// readyToMakeFootBoard에서 만든 불값2차원배열을 발판 요소들로 대체시키기
func transferBoolToHorizon(booleanElement: Bool) -> String {
    return booleanElement ? LadderFootBoardElements.hasFootBoard.rawValue : LadderFootBoardElements.noFootBoard.rawValue
}

// 사다리 모양 완성시키기
func makeFootBoard(_ player: Int, _ ladderHeight:Int){
    let readyFootBoard = preparadeToMakeFootBoard(player, ladderHeight)
    for raw in 0 ..< ladderHeight {
        print ("|", terminator: "")
        for col in 0 ..< player - 1 {
          let footboard = transferBoolToHorizon(booleanElement: readyFootBoard[raw][col])
            print ("\(footboard)", terminator : "|")
        }
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    makeFootBoard(player, ladderHeight)

    break
}
