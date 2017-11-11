//
//  GameOption.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 11..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

//InputView에서 입력된 값을 저장하는 Data Object
struct GameOption {
    var inputPlayerNames : [String]
    var inputHeight : Int
    
    init (_ inputValue: (playerNames: [String], ladderHeight: Int)) {
        self.inputPlayerNames = inputValue.playerNames
        self.inputHeight = inputValue.ladderHeight
    }
}
