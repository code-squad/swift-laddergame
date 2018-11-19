//
//  ResultView.swift
//  LadderGame
//
//  Created by 임차혁 on 2018. 10. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    let ladderStep: String = "-----"
    let blankSpace: String = "     "
    
    // 이름을 출력
    func printPlayerName(ladderPlayer: [LadderPlayer]) {
        for player in ladderPlayer {
            printBlankSpace(printBlankSpaceNum(name: player.name).front)
            print(player.name, terminator: "")
            printBlankSpace(printBlankSpaceNum(name: player.name).bankend)
        }
        print()
    }
    func printBlankSpaceNum(name: String) -> (front: Int, bankend: Int) {
        var blankSpace: (Int, Int) = (0, 0)
        switch name.count {
        case 1:
            blankSpace = (2, 3)
        case 2:
            blankSpace = (2, 2)
        case 3:
            blankSpace = (1, 2)
        case 4:
            blankSpace = (1, 1)
        case 5:
            blankSpace = (0, 1)
        default:
            print("Error")
        }
        return blankSpace
    }
    func printBlankSpace(_ number: Int) {
        for _ in 0..<number {
            print(" ", terminator: "")
        }
    }
    // 사다리를 출력
    func makeLadderStep(step: Bool) -> String {
        return step ? self.ladderStep : self.blankSpace
    }
    func printLadderStepOneLine(ladderStep: [LadderStep]) {
        for oneStep in ladderStep {
            print(makeLadderStep(step: oneStep.step), terminator: "|")
        }
    }
    func printWholeLadderStep(ladder: [[LadderStep]]) {
        for oneLineLadderStep in ladder {
            print("  |", terminator: "")
            printLadderStepOneLine(ladderStep: oneLineLadderStep)
            print()
        }
    }
}
