//
//  LadderGame.swift
//  LadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    let height : Int
    private(set) var names : [LadderPlayer]
    private(set) var ladder : Array<Array<String>>
    
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
    
    // 사다리 틀 만들기
    mutating func makeLadderLayer() {
        for i in 0..<self.height {
            self.ladder.append(Array<String>())
            setLadderLine(lineNum: i)
            self.ladder[i].append(LadderPrint.bar.rawValue)
        }
    }
    // 사다리 각 라인 만들기
    mutating private func setLadderLine(lineNum: Int) {
        for _ in 1..<self.names.count {
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
