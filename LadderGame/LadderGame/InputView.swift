//
//  InputView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


enum Question: String {
    case people = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case ladderHight = "최대 사다리 높이는 몇 개인가요?"
}


struct InputView {
    
    private func userInput(question: Question) throws -> String {
        print(question.rawValue)
        guard let answer = readLine() else {
            throw UserInputError.emptyValue
        }
        return answer
    }
    
    
    func playerName() throws -> Array<String> {
        let answer = try userInput(question: Question.people)
        let names = answer.components(separatedBy: ",")
        
        guard answer != "" else {
            throw UserInputError.emptyValue
        }
        
        guard names.count != 1 else {
            throw UserInputError.incorrectPlayerData
        }
        
        var largeNameCount = 0
        for index in 0..<names.count {
            if largeNameCount < names[index].count {
                largeNameCount = names[index].count
                guard largeNameCount < 6 else {
                    throw UserInputError.overNameCount
                }
            }
        }
        return names
    }
    
    
    func ladderHight() throws -> Int {
        let answer = try userInput(question: Question.ladderHight)
        
        guard answer != "" else {
            throw UserInputError.emptyValue
        }
        
        guard let ladderHight = Int(answer) else {
            throw UserInputError.incorrectLadderData
        }
        return ladderHight
    }
}


enum UserInputError: Error {
    case emptyValue
    case overNameCount
    case incorrectPlayerData
    case incorrectLadderData
    
    var description: String {
        switch self {
        case .emptyValue: return "값이 없습니다"
        case .overNameCount: return "플레이어이름은 5글자까지 가능합니다"
        case .incorrectPlayerData: return "플레이어를 두사람이상 입력해주세요."
        case .incorrectLadderData: return "사다리의 높이는 숫자로 입력해주세요"
        }
    }
}
