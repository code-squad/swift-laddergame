//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 사다리 구성 요소
enum LadderPrint : Character {
    case bar = "|"
    case step = "-"
    case empty = " "
}

// 사다리 구현을 위한 이중 배열
var result : Array<Array<Character>> = Array<Array<Character>>()

// 사다리 게임 세팅
func setLadderGame() {
    var playerCount : Int = 0
    var ladderHeight : Int = 0
    repeat {
        playerCount = getPlayerCount()
        ladderHeight = getLadderHeight()
    } while(!(playerCount > 0) || !(ladderHeight > 0))
    makeLadderLayer(ladderHeight: ladderHeight, playerCount: playerCount)
}
// 참여인원 입력
func getPlayerCount() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    return Int(readLine() ?? "0") ?? 0
}
// 최대 사다리 높이 입력
func getLadderHeight() -> Int {
    print("최대 사다리의 높이는 몇 개인가요?")
    return Int(readLine() ?? "0") ?? 0
}

// 사다리 틀 만들기
func makeLadderLayer(ladderHeight: Int, playerCount: Int) {
    for i in 0..<ladderHeight {
        result.append(Array<Character>())
        setLadderLine(lineNum: i, playerCount: playerCount)
        result[i].append(LadderPrint.bar.rawValue)
    }
}
// 사다리 각 라인 만들기
func setLadderLine(lineNum: Int, playerCount: Int) {
    for _ in 1..<playerCount {
        result[lineNum].append(LadderPrint.bar.rawValue)
        setStep(lineNum: lineNum)
    }
}
// 발판 유무
func setStep(lineNum: Int) {
    guard Int(arc4random_uniform(2)) > 0 else {
        result[lineNum].append(LadderPrint.empty.rawValue)
        return
    }
    result[lineNum].append(LadderPrint.step.rawValue)
}

// 사다리 출력
func printResult(result: Array<Array<Character>>) {
    for i in 0..<result.count {
        printLadderLineResult(lineResult: result[i])
    }
}
// 사다리 각 라인출력
func printLadderLineResult(lineResult: Array<Character>) {
    let playerCount : Int = lineResult.count
    for j in 0..<(playerCount-1) {
        print(lineResult[j], terminator: "")
    }
    print(lineResult[playerCount-1])
}

setLadderGame()
printResult(result: result)

