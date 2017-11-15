//
//  ChekingInput.swift
//  LadderGame
//
//  Created by Hong on 2017. 11. 15..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckingInput {
    enum InputError: String, Error {
        case emptyNames = "사용자이름은 반드시 필요합니다."
        case wrongSeparator = "이름은 쉼표로 구분해주세요."
        case emptyHeight = "사다리 높이를 반드시 입력해주세요."
        case wrongHeight = "사다리 높이는 1 이상이어야 합니다."
    }
    
    func checkValidInput (_ inputValue: (playerNames: String?, ladderHeight: String?)) throws -> GameOption {
        let inputPlayersName = inputValue.playerNames ?? ""
        if inputPlayersName == "" {
            throw InputError.emptyNames }
        if !inputPlayersName.contains(",") {
            throw InputError.wrongSeparator }
        let playerNames = inputPlayersName.split(separator: ",").map(String.init)
        
        let inputHeight =  inputValue.ladderHeight ?? ""
        if inputHeight == "" {
            throw InputError.emptyHeight }
        let ladderHeight = Int(inputHeight)
        if ladderHeight! <= 1 {
            throw InputError.wrongHeight }
        let inputOption = (playerNames, ladderHeight!)
        let gameOption = GameOption(inputOption)
        
        return gameOption
    }
    
    
    
    
}
