//  main.swift
//  LadderGame
//  Created by Jack.
import Foundation

let runLadderGame : Bool = true
while runLadderGame == true {
    let inputView : InputView = InputView()
    let resultView : ResultView = ResultView()
    
    let entry = inputView.generateEntry()
    let heightOfLadder = inputView.generateHeight()
    guard heightOfLadder != 0 else {
        break
    }
    guard let userEntry = entry else {
        break
    }
    let ladderGame = LadderGame.init(namesVal: userEntry, heightVal: heightOfLadder)
    let ladder = ladderGame.generateSetOfLadder(entryVal: userEntry.count, heightVal: heightOfLadder)
    let incompleteLadder = ladderGame.drawLadderWithHorizontalLines(ladderSet: ladder)
    resultView.printCompleteLadder(ladderSet: incompleteLadder)
}

