//
//  ResultView.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    private let _ladderStep: LadderStep = LadderStep()
    var ladderStep: LadderStep {
        get {
            return _ladderStep
        }
    }
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
    
    private func convertNameFormat(_ player: LadderPlayer) -> String{
        let nameLength = player.nameLength
        let name = player.name
        var printedName: String = ""
        switch nameLength{
        case 1:
            printedName = "  "+name+"  "
        case 2:
            printedName = "  "+name+" "
        case 3:
            printedName = " "+name+" "
        case 4:
            printedName = name+" "
        case 5:
            printedName = name
        default:
            printedName = name
        }
        return printedName
    }
    
    private func printPlayerNames(_ ladderGame: LadderGame) -> Void {
        for player in ladderGame.playerList {
            let playerNameFormat = convertNameFormat(player)
            print(playerNameFormat, terminator: " ")
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
