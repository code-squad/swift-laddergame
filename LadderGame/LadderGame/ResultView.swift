//
//  ResultView.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    private var _ladderGame: LadderGame?
    private var ladderStep: LadderStep = LadderStep()
    internal var ladderGame: LadderGame{
        get{
            guard let ladderGame = _ladderGame else {
                return LadderGame()
            }
            return ladderGame
        }
        set(value){
            _ladderGame = value
        }
    }
    internal func printLadder() -> Void {
        guard let ladder2dMap = self._ladderGame?.ladder2dMap else{
            print("printLadder error - no initialized ladderGame Property in ResultView Instance")
            return
        }
        for (rowItems) in ladder2dMap {
            printEachRowLadder(rowItems)
        }
        printPlayerNames()
    }
    
    private func printPlayerNames() -> Void {
        guard let ladderGame = self._ladderGame else{
            print("printPlayerNames error - no initialized ladderGame Property in ResultView Instance")
            return
        }
        for player in ladderGame.names {
            print(player.nameTobePrinted, terminator: " ")
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
        print(ladderStep.initialVerticalAxis, terminator: "")
        for (columnItem) in eachRow {
            print("\(columnItem)", terminator: ladderStep.verticalAxis)
        }
        print()
    }
}
