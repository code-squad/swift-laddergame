//
//  InputView.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func userInput() -> (playerNames: String?, ladderHeight: String?){
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let players = readLine()
        print("사다리 높이는 몇 층인가요?")
        let ladderHeight = readLine()
        let inputValue = (players, ladderHeight)
        return inputValue
    }
    
}
