//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

func main() {
       print(LADDERGAME_USER_COUNT_MESSAGE)
    do {
        let palyers = try Input().playerNames()
        print(LADDERGAME_HEIGHT_COUNT_MESSAGE)
        let ladderHieght = try Input().height()
        let ladderGame = LadderGame.init(palyers, ladderHieght)
        let ladderConnectForm = try ladderGame.makeLadderForm()
        Output().ladder(ladderConnectForm)
        Output().player(palyers)
        
    } catch {
        print("사다리 게임 에러")
        return
    }
}

main()

