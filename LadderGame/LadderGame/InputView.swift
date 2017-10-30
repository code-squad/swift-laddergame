//
//  InputView.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    var nameOfPlayers: String?
    var heightForLadder: Int?
    
    init() {
        nameOfPlayers = ""
        heightForLadder = 0
    }
        
    mutating func prompt() {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        nameOfPlayers = readLine()
        
        print("최대 사다리 높이는 몇 개인가요?")
        let temp = readLine()!
        heightForLadder = Int(temp)!
    }
}
