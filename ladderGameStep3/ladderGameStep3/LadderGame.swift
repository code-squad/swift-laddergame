//
//  LadderGame.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//
import Foundation

// 사다리 높이 속성과 참여자를 Array로 포함하는 LadderGame struct
struct LadderGame {
    var height = Int()
    var names = Array<String>()
    init(inputView: InputView) {
        height = inputView.heightOfLadder
        names = inputView.names
    }
}
