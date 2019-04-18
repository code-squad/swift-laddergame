//
//  ResultView.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    var ladderGame: LadderGame?
    var printSpace: Int = 5 // default
    var ladderStep: LadderStep = LadderStep()

    func printLadder() -> Void {
        guard let ladder2dMap = self.ladderGame?.ladder2dMap else{
            print("printLadder error - no initialized ladderGame Property in ResultView Instance")
            return
        }
        for (rowItems) in ladder2dMap {
            printEachRowLadder(rowItems)
        }
        printPlayerNames()
    }
    
    private func printPlayerNames() -> Void {
        guard let ladderGame = self.ladderGame else{
            print("printPlayerNames error - no initialized ladderGame Property in ResultView Instance")
            return
        }
        for player in ladderGame.names {
            print(player.name, terminator: " ")
        }
        print()
    }
    
    private func printEachRowLadder(_ row: [Bool] ) -> Void {
        let eachRow = row.map{ (value) -> String in
            if value {
                return ladderStep.horizontalLadder
            }
            return ladderStep.emptyLadder
        }
        for (columnItem) in eachRow {
            print("|\(columnItem)", terminator: "")
        }
        print ("|")
    }

    
}
