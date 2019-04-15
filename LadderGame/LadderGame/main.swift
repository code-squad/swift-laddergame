//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

func inputRoop (_ inputView: InputView) -> InputView {
    var view: InputView = inputView
    while true {
        do {
            try view.inputPlayerNames()
            try view.inputMaximumHeight()
            break
        }
        catch LadderGameErrors.lessNumber {
            print("참여할 사람과 최대 사다리 높이는 최소 2 이상이어야합니다.")
        }
        catch LadderGameErrors.toLongName {
            print("참가자 이름은 최대 영문 5글자입니다.")
        }
        catch {
            print("알 수 없는 오류입니다")
        }
    }
    
    return view
}

func main () {
    var inputView: InputView = InputView()
    inputView = inputRoop(inputView)
    let resultView: ResultView = ResultView()
    var ladderGame: LadderGame = LadderGame(inputView.maximumHeight, inputView.players)
    ladderGame.makeLadder()
    resultView.printLadder(inputView.players, ladderGame.ladderBoard)
}

main ()
