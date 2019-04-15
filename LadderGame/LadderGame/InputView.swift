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
    func getUserInputForGame() -> ([String]?, Int?){
        
        do{
            let namesOfPlayers: [String] = try getNamesOfPlayers()
            let maxHeightOfLadder: Int = try getHeightOfLadder()
            return (namesOfPlayers, maxHeightOfLadder)
        } catch {
            print("Error while processing input: \(error)")
            return (nil, nil)
        }
        
    }
    
    //get names of player
    private func getNamesOfPlayers() throws -> [String] {
        guard let namesInLine = getUserAnswerTo(question: "참여할 사람 이름 (쉼표,로 구분하세요): ") else {
            throw InputError.invalidNamesOfPlayers
        }
        let splitedNames = namesInLine.components(separatedBy: ",")
        if splitedNames.isEmpty || splitedNames.contains(""){
            throw InputError.invalidNamesOfPlayers
        }
        return splitedNames
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
