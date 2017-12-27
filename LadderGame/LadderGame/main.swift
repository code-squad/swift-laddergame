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

// 사다리 만들기(2차원 배열)
func makeLadder(_ player:Int, _ ladderHeight:Int) -> [[String]] {
    let colCount = player + (player - 1)
    var arrLadder: [[String]] = Array(repeating: Array(repeating: "|", count: colCount), count: ladderHeight)
    

    for raw in 0 ..< arrLadder.count {
        for col in 0 ..< colCount {
            if col % 2 == 1 {
                arrLadder[raw][col] = " "
            }
        }
    }
    return arrLadder
}

// 랜덤번호 추출(추후 만들어진 사다리 배열에 랜덤한 위치에 발판을 추가위한 행,열 랜덤 번호)
// 행
func rawRandom(_ player:Int, _ ladderHeight:Int) -> Array<Int> {
    var ladderRowRandom:[Int] = []
    
    for _ in 0 ..< player {
        ladderRowRandom.append(Int(arc4random_uniform(UInt32(ladderHeight))))
    }
    return ladderRowRandom
}

// 열
func colRandom(_ player:Int) -> Array<Int> {
    var ladderColRandom:[Int] = []
    var oddRandom = 0
    
    while ladderColRandom.count != player  {
        oddRandom = Int(arc4random_uniform(UInt32(player)) + 1)
        if oddRandom % 2 == 0 {
            oddRandom = Int(arc4random_uniform(UInt32(player)) + 1)
        } else {
            ladderColRandom.append(oddRandom)
        }
    }
    return ladderColRandom
}

// 사다리 발판 만들기(랜덤하게 만든 행,열 숫자로 발판 만들기)
func makeFootBoard(_ player:Int, _ ladderHeight:Int) -> [[String]] {
    var madeLadder = makeLadder(player,ladderHeight)
    let raw = rawRandom(player,ladderHeight)
    let col = colRandom(player)
    
    for i in 0 ..< player {
        madeLadder[raw[i]][col[i]] = "-"
    }
    return madeLadder
}

// 사다리 출력
func printLadder(_ resultLadder:[[String]]) {
    for raw in 0 ..< resultLadder.count {
        for col in 0 ..< resultLadder[raw].count {
            print(resultLadder[raw][col], terminator: "")
        }
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    let resultLadder = makeFootBoard(player,ladderHeight)
    
    printLadder(resultLadder)
    
    break
}





