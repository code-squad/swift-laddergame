//
//  InputView.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    enum InputError: String, Error {
        case emptyNames = "사용자이름은 반드시 필요합니다."
        case wrongSeparator = "이름은 쉼표로 구분해주세요."
        case emptyHeight = "사다리 높이를 반드시 입력해주세요."
        case wrongHeight = "사다리 높이는 1 이상이어야 합니다."
    }
    
    func userInput() throws -> GameOption {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let inputPlayersName = readLine() ?? ""
        if inputPlayersName == "" {
            throw InputError.emptyNames }
        if !inputPlayersName.contains(",") {
            throw InputError.wrongSeparator }
        let playerNames = inputPlayersName.split(separator: ",").map(String.init)
        
        print("사다리 높이는 몇 층인가요?")
        let inputHeight =  readLine() ?? ""
        if inputHeight == "" {
            throw InputError.emptyHeight }
        let ladderHeight = Int(inputHeight)
        if ladderHeight! <= 1 {
            throw InputError.wrongHeight }
        let inputValue = (playerNames, ladderHeight!)
        let gameOption = GameOption(inputValue)
        
        return gameOption
    }
    
}
