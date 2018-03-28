//
//  ResultView.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//


struct ResultView {

    private static let bar: String = "-----"
    private static let blank: String = "     "
    
    static func drawLadder(_ ladder: [[LadderStep]]) {
        for row in ladder {
            print(" |", terminator: "")
            drawBar(row)
            print()
        }
    }
    
    private static func drawBar(_ row: [LadderStep]) {
        for column in row {
            print(makeBar(element: column.step), terminator: "|")
        }
    }
    
    private static func makeBar(element: Bool) -> String {
        return element ? self.bar : self.blank
    }
    
    static func printPlayerNames(_ namesOfPlayers: [String]) {
        for nameOfPlayer in namesOfPlayers {
            print(nameOfPlayer, terminator: "")
            printSpace(name: nameOfPlayer)
        }
        print()
    }
    
    static private func printSpace(name: String) {
        let blank: Int = 6 - name.count

        for _ in 0..<blank {
            print(" ", terminator: "")
        }
    }
}
