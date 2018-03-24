//
//  ResultView.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//


struct ResultView {
    
    func drawLadder(_ ladder: [[LadderStep]]) {
        for row in ladder {
            print(" |", terminator: "")
            drawBar(row)
            print()
        }
    }
    
    func drawBar(_ row: [LadderStep]) {
        for column in row {
            print(makeBar(element: column.step), terminator: "|")
        }
    }
    
    func makeBar(element: Bool) -> String {
        return element ? "-----" : "     "
    }
    
    func printNamesOf(_ ladderPlayers: [LadderPlayer]) {
        for player in ladderPlayers {
            print(player.name, terminator: "")
            printSpace(name: player.name)
        }
        print()
    }
    
    func printSpace(name: String) {
        let blank: Int = 6 - name.count

        for _ in 0..<blank {
            print(" ", terminator: "")
        }
    }
}
