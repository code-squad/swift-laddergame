//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func playGame() {
    let inputView = InputView()
    var names = [String]()
    var ladderHigh: Int = 0
    var ladderGame = LadderGame()
    var resultView = ResultView()
    
    
    while true {
        do {
            names = try inputView.playerName()
            ladderHigh = try inputView.ladderHight()
            break
            
        } catch UserInputError.emptyValue{
            print(UserInputError.emptyValue.description)
        } catch UserInputError.overNameCount{
            print(UserInputError.overNameCount.description)
        } catch UserInputError.incorrectPlayerData{
            print(UserInputError.incorrectPlayerData.description)
        } catch UserInputError.incorrectLadderData{
            print(UserInputError.incorrectLadderData.description)
        } catch {
            print("알 수 없는 에러")
        }
    }
    
    let game = ladderGame.processingGame(playerNames: names, playCount: ladderHigh)
    resultView.printLadders(ladders: game)
    resultView.arrangeName(playerNames: names)
    
}

playGame()
