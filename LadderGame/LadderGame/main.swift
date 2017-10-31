//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    var isRepeat: Bool = true
    
    while(isRepeat) {
        let input: (askResult: Bool, userNames: String, ladderHeight: String) = Input.askInputValue()
        
        guard input.askResult else {
            return isRepeat = input.askResult
        }
        
        let resultGame = LadderGame.startGame(userNames: input.userNames, ladderHeight: input.ladderHeight)
        isRepeat = Result.printResult(resultGame)
        
        guard isRepeat else {
            break
        }
    }
    
    if !isRepeat {
        print("게임이 종료되었습니다.")
    }
}

main()
