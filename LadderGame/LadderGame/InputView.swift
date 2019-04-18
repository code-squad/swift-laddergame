//
//  InputView.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidNamesOfPlayers
    case invalidHeightOfLadder
}

struct InputView {

    static func getLadderDataForGame() throws -> ([String], Int) {
        let namesOfPlayers: [String] = try getNamesOfPlayers()
        let maxHeightOfLadder: Int = try getHeightOfLadder()
        return (namesOfPlayers, maxHeightOfLadder)
    }
    
    //get names of player
    static private func getNamesOfPlayers() throws -> [String] {
        let question = "참여할 사람 이름 (1명 이상, 쉼표,로 구분하세요): "
        guard let namesInLine = getAnswerTo(question) else {
            throw InputError.invalidNamesOfPlayers
        }
        let splitedNames = namesInLine.components(separatedBy: ",")
        if areNamesInvalidForGame(namesOfPlayer: splitedNames) {
            throw InputError.invalidNamesOfPlayers
        }
        return splitedNames
    }
    
    static public func areNamesInvalidForGame(namesOfPlayer: [String]) -> Bool {
        return namesOfPlayer.isEmpty || namesOfPlayer.contains("") || namesOfPlayer.count == 1 || namesOfPlayer.contains(" ")
    }
    
    //get height of ladder
    static private func getHeightOfLadder() throws -> Int {
        let question = "최대 사다리 높이"
        guard let maxHeightOfLadder = getAnswerTo(question) else {
            throw InputError.invalidHeightOfLadder
        }
        guard let convertedHeight = Int(maxHeightOfLadder), convertedHeight < 1 else {
            throw InputError.invalidHeightOfLadder
        }
        return convertedHeight
    }
    
    static private func getAnswerTo(_ question: String) -> String? {
        print(question)
        guard let answer = readLine() else {
            return nil
        }
        return answer
    }
}
