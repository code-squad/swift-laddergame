//  main.swift
//  LadderGame
//  Created by Jack.
import Foundation

let runLadderGame : Bool = true
while runLadderGame == true {
    let entry = InputView().generateEntry()
    guard let userEntry = entry else {
        break
    }
    let heightOfLadder = InputView().generateHeight()
    guard heightOfLadder != 0 else {
        break
    }

    let ladderGame = LadderGame.init(namesVal: userEntry, heightVal: heightOfLadder)
    let ladder = ladderGame.generateSetOfLadder(entryVal: userEntry.count, heightVal: heightOfLadder)
    let incompleteLadder = ladderGame.drawLadderWithHorizontalLines(ladderSet: ladder)
    
    ResultView().printCompleteLadder(ladderSet: incompleteLadder, players: userEntry)
}

