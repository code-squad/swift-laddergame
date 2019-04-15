//
//  InputView.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    private static func readAnswer(to question: Question) throws -> String {
        print(question.rawValue)
        
        guard let answer = readLine() else {
            throw UserInputError.emptyValue
        }
        
        return answer
    }
    
    func readNames() throws -> [LadderPlayer] {
        
        let answer = try InputView.readAnswer(to: Question.player)
        let names = answer.components(separatedBy: ",").map { LadderPlayer(name: $0) }
        print(names)
        
        return names
    }
    
    func readHeight() throws -> Int {
        
        let answer = try InputView.readAnswer(to: Question.height)
        
        guard let height = Int(answer.trimmingCharacters(in: CharacterSet.whitespaces)) else {
            throw UserInputError.incorrectFormat
        }
        
        guard height > 0 else {
            throw UserInputError.negativeValue
        }
        
        return height
    }
    
}

