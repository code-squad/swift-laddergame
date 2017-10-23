//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    let name : String
}

struct LadderGame {
    
    var height : Int = 0
    var names : [LadderPlayer]
    var ladder : Array<Array<String>>
    
    // 사다리 구성 요소
    enum LadderPrint : String {
        case bar = "|"
        case step = "-----"
        case empty = "     "
    }
    
    // 사다리 틀 만들기
    mutating func makeLadderLayer(ladderHeight: Int, playerNames: [String.SubSequence]) {
        for i in 0..<ladderHeight {
            self.ladder.append(Array<String>())
            setLadderLine(lineNum: i, playerCount: playerNames.count)
            self.ladder[i].append(LadderPrint.bar.rawValue)
        }
        for i in 0..<playerNames.count {
            self.names.append(LadderPlayer.init(name: String(playerNames[i])))
        }
    }
    // 사다리 각 라인 만들기
    mutating func setLadderLine(lineNum: Int, playerCount: Int) {
        for _ in 1..<playerCount {
            self.ladder[lineNum].append(LadderPrint.bar.rawValue)
            setStep(lineNum: lineNum)
        }
    }
    // 발판 유무
    mutating func setStep(lineNum: Int) {
        guard Int(arc4random_uniform(2)) > 0 else {
            self.ladder[lineNum].append(LadderPrint.empty.rawValue)
            return
        }
        self.ladder[lineNum].append(LadderPrint.step.rawValue)
    }
}

struct InputView {
    
    // 참여인원 입력
    static func getPlayerCount() -> String {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        return readLine() ?? ""
    }
    // 최대 사다리 높이 입력
    static func getLadderHeight() -> Int {
        print("최대 사다리의 높이는 몇 개인가요?")
        return Int(readLine() ?? "0") ?? 0
    }
    
}

struct ResultView {
    
    // 사다리 출력
    static func printResult(result: Array<Array<String>>) {
        for i in 0..<result.count {
            printLadderLineResult(lineResult: result[i])
        }
    }
    // 사다리 각 라인출력
    static func printLadderLineResult(lineResult: Array<String>) {
        let playerCount : Int = lineResult.count
        for j in 0..<(playerCount-1) {
            print(lineResult[j], terminator: "")
        }
        print(lineResult[playerCount-1])
    }
    
    // player 출력
    static func printPlayers(players: Array<LadderPlayer>) {
        for player in players {
            print(player.name, terminator:" ")
        }
    }
}

// 사다리 게임 세팅
func setLadderGame() -> LadderGame {
    var playerNames : [String.SubSequence]
    var ladderHeight : Int = 0
    repeat {
        playerNames = InputView.getPlayerCount().split(separator: ",")
        ladderHeight = InputView.getLadderHeight()
    } while(!(playerNames.count > 0) || !(ladderHeight > 0))
    var ladderGame : LadderGame = LadderGame(height: ladderHeight, names: [], ladder: [])
    ladderGame.makeLadderLayer(ladderHeight: ladderHeight, playerNames: playerNames)
    return ladderGame
}

let ladderGame = setLadderGame()
ResultView.printResult(result: ladderGame.ladder)
ResultView.printPlayers(players: ladderGame.names)

