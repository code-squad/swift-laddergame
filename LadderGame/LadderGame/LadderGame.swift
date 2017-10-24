//
//  LadderGame.swift
//  LadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    var height : Int = 0
    var names : [LadderPlayer] = []
    var ladder : Array<Array<String>> = []
    
    // 사다리 구성 요소
    private enum LadderPrint : String {
        case bar = "|"
        case step = "-----"
        case empty = "     "
    }
    
    // 사다리 틀 만들기
    mutating func makeLadderLayer(playerNames: [String.SubSequence]) {
        for i in 0..<self.height {
            self.ladder.append(Array<String>())
            setLadderLine(lineNum: i, playerCount: playerNames.count)
            self.ladder[i].append(LadderPrint.bar.rawValue)
        }
        registPlayers(playerNames: playerNames)
    }
    // 사다리 각 라인 만들기
    mutating private func setLadderLine(lineNum: Int, playerCount: Int) {
        for _ in 1..<playerCount {
            self.ladder[lineNum].append(LadderPrint.bar.rawValue)
            setStep(lineNum: lineNum)
        }
    }
    // 발판 유무
    mutating private func setStep(lineNum: Int) {
        guard Int(arc4random_uniform(2)) > 0 else {
            self.ladder[lineNum].append(LadderPrint.empty.rawValue)
            return
        }
        self.ladder[lineNum].append(LadderPrint.step.rawValue)
    }
    
    // 플레이어 등록
    mutating private func registPlayers(playerNames: [String.SubSequence]) {
        for i in 0..<playerNames.count {
            var playerName = String(playerNames[i]).trimmingCharacters(in: [" "])
            playerName = ("".padding(toLength: Int(round(Double(5-playerName.count-2)/2)+1), withPad: " ", startingAt: 0) + playerName).padding(toLength: 5, withPad: " ", startingAt: 0)
            self.names.append(LadderPlayer.init(name: playerName))
        }
    }
}
