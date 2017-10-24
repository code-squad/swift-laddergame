//
//  LadderGame.swift
//  LadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    private var height : Int
    private var names : [LadderPlayer]
    private var ladder : Array<Array<String>>
    
    // 사다리 구성 요소
    private enum LadderPrint : String {
        case bar = "|"
        case step = "-----"
        case empty = "     "
    }
    
    // Initializer
    init(height: Int, names: [LadderPlayer]) {
        self.height = height
        self.names = names
        self.ladder = []
    }
    
    // getter
    var getNames : [LadderPlayer] {
        get {
            return self.names
        }
    }
    var getLadder : Array<Array<String>> {
        get {
            return self.ladder
        }
    }
    
    // 사다리 틀 만들기
    mutating func makeLadderLayer(playerNames: [LadderPlayer]) {
        for i in 0..<self.height {
            self.ladder.append(Array<String>())
            setLadderLine(lineNum: i, playerCount: playerNames.count)
            self.ladder[i].append(LadderPrint.bar.rawValue)
        }
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
}
