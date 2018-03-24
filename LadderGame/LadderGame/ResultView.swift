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
            print("|", terminator: "")
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
}
