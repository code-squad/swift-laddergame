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
    func getUserInputForGame() -> ([Substring], Int){
        // get input
        // process it - split or convert
        // return it
        var namesOfPlayers: [Substring]! = nil
        var maxHeightOfLadder: Int! = nil
        do {
            namesOfPlayers = try getNamesOfPlayers()
            maxHeightOfLadder = try getHeightOfLadder()
        } catch {
            print("Error: \(error)")
        }
        
        return (namesOfPlayers, maxHeightOfLadder)
        
    }
    
    //get names of player
    private func getNamesOfPlayers() throws -> [Substring] {
        guard let nameInLine = getUserAnswerTo(question: "참여할 사람 이름 (쉼표,로 구분하세요): ") else {
            throw InputError.invalidNamesOfPlayers
        }
        let names = nameInLine.split(separator: ",")
        if names.isEmpty {
            throw InputError.invalidNamesOfPlayers
        }
        return names
    }
    
    //get height of ladder
    private func getHeightOfLadder() throws -> Int {
        guard let maxHeightOfLadder = getUserAnswerTo(question: "최대 사다리 높이") else {
            throw InputError.invalidHeightOfLadder
        }
        guard let convertedHeight = Int(maxHeightOfLadder) else {
            throw InputError.invalidHeightOfLadder
        }
        return convertedHeight
    }
    
    private func getUserAnswerTo(question: String) -> String? {
        print(question)
        guard let answer = readLine() else {
            return nil
        }
        return answer
    }
}
