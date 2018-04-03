//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

func main() {
    var ladderGame: LadderGame
    var players: [LadderPlayer]
    var height: Int
    do {
        print(LADDERGAME_USER_COUNT_MESSAGE)
        players = try InputView().playerNames()
        print(LADDERGAME_HEIGHT_COUNT_MESSAGE)
        height = try InputView().height()
        
        guard InputViewChecker.checker(players, height) else {
            throw LadderGameError.unAvailableError
        }
        ladderGame = LadderGame.init(players, height)
    } catch {
        print("알 수 없는 에러")
        return
    }
    
    let ladderConnectForm = ladderGame.makeLadderForm()
    ResultView.ladder(ladderConnectForm )
    ResultView.player(players)
}

main()

