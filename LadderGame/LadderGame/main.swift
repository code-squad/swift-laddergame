//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    var result: Result = Result(status: true, message: "", ladderGame: nil)
   
    while(result.status) {
        guard let inputUserNames = Input.askInputValue("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)", "\n") else {
            result.status = false
            result.message = "참여자 이름을 입력하세요."
            result.ladderGame = nil
            break
        }
        
        guard let inputLadderHeight = Input.askInputValue("최대 사다리 높이는 몇 개인가요?", "\n") else {
            result.status = false
            result.message = "사다리 높이를 입력하세요."
            result.ladderGame = nil
            break
        }
    
        let readyGame = LadderGame.prepareGame(userNames: inputUserNames, ladderHeight: inputLadderHeight)
        
        result.status = readyGame.status
        result.message = readyGame.message
        result.ladderGame = readyGame.ladderGame
        
        guard result.status else {
            break
        }
    }
}

main()
