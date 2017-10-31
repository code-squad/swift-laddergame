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
        guard let inputUserNames = Input.askInputValue("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)", "\n") else {
            break
        }
        
        guard let inputLadderHeight = Input.askInputValue("최대 사다리 높이는 몇 개인가요?", "\n") else {
            break
        }
    
        let resultGame = LadderGame.startGame(userNames: inputUserNames, ladderHeight: inputLadderHeight)        
        isRepeat = Result.printResult(ladder: resultGame.0, ladderGame: resultGame.1)
        
        if !isRepeat {
            print("게임이 종료되었습니다.")
            break
        }
    }
}

main()
