//
//  LadderGame.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리의 높이 속성과 참여자를 Array로 표현
struct LadderGame {
    var names : [String]
    var ladderHeight : Int
    
    init(inputText:(players : [String], height : Int)){
        names = inputText.players
        ladderHeight = inputText.height
    }
}


