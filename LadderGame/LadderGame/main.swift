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
    let frameOfladder = ladderGame.generateFrameOfLadder(entryVal: userEntry.count, heightVal: heightOfLadder)
    let randomLadder = ladderGame.generateRandomLadder(frameOfLadder: frameOfladder)
    
    let incompleteLadder = ResultView().drawHorizontalLines(randomLadder:  randomLadder, playerNum: userEntry.count)
    ResultView().printCompleteLadder(ladderSet: incompleteLadder, players: userEntry)
}

