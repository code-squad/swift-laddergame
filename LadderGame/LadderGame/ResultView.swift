//
//  ResultView.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    private var ladderStep: LadderStep = LadderStep()

    func printLadder(_ ladderGame: LadderGame) -> Void {
        guard let ladder2dMap = ladderGame.ladder2dMap else{
            print("ladder2dMap in LadderGame parameter is undefined")
            return
        }
        for (rowItems) in ladder2dMap {
            printEachRowLadder(rowItems)
        }
        printPlayerNames(ladderGame)
    }
    
    private func printPlayerNames(_ ladderGame: LadderGame) -> Void {
        for player in ladderGame.playerList {
            print(player.nameTobePrinted, terminator: " ")
        }
        print()
    }
    
    private func printEachRowLadder(_ row: [Bool] ) -> Void {
        print(ladderStep.initialVerticalAxis, terminator: "")
        _ = row.map{ (value) -> String in
            if value {
                print("\(ladderStep.horizontalLadder)", terminator: ladderStep.verticalAxis)
                return ladderStep.horizontalLadder
            }
            print("\(ladderStep.emptyLadder)", terminator: ladderStep.verticalAxis)
            return ladderStep.emptyLadder
        }
        print()
    }
}
