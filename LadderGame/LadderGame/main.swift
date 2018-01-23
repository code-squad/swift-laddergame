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

// 사다리 발판 준비 - 서브
// false 값을 가지고 있는 배열을 랜덤값에 따라 랜덤하게 false를 true로 바꿈
func randomChange(_ arrLadder:[Bool]) -> [Bool]{
    var ladderArr:[Bool] = arrLadder
    
    for val in 0 ..< ladderArr.count {
        let random = arc4random_uniform(2)
        ladderArr[val] = (random == 0)
    }
    return ladderArr
}

// 사다리 발판 준비 - 메인
// bool값 2차원 배열 만들기
func makeLadderFrame(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
    let arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)
    return arrLadder
}
// 불값으로 만든 2차원 배열로 사다리 준비
func preparadeToMakeFootBoard(_ player: Int, _ ladderHeight: Int) -> [[Bool]] {
    var arrLadder = makeLadderFrame(player,ladderHeight)

    for row in 0 ..< ladderHeight {
        arrLadder[row] = randomChange(arrLadder[row])
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

// 사다리 모양 완성시키기 - 서브
func makeWall(_ readyFootBoard:[Bool],_ player: Int) {
    for val in 0 ..< player - 1 {
        let footboard = transferBoolToHorizon(booleanElement: readyFootBoard[val])
        print ("\(footboard)", terminator : "|")
    }
}

// 사다리 모양 완성시키기 - 메인
func makeLadder(_ player: Int, _ ladderHeight:Int) {
    let readyFootBoard = preparadeToMakeFootBoard(player, ladderHeight)
    for row in 0 ..< ladderHeight  {
        print ("|", terminator: "")
        makeWall(readyFootBoard[row], player)
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    makeLadder(player, ladderHeight)

    break
}
