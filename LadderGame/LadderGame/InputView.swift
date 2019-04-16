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
        
        for player in names {
            guard player.name.count < 6 else {
                throw UserInputError.longName
            }
        }
        
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

enum Question: String {
    case player = "참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case height = "최대 사다리 높이는 몇 개인가요?"
}

enum UserInputError: Error {
    case incorrectFormat
    case emptyValue
    case negativeValue
    case longName
}

extension UserInputError: CustomStringConvertible {
    var description: String {
        switch self {
        case .incorrectFormat: return "정확하지 않은 형식입니다. 0 이상의 정수만 입력해주세요."
        case .emptyValue: return "값이 없습니다."
        case .negativeValue: return "0 이상의 값을 입력해주세요."
        case .longName: return "5글자 이하의 이름을 입력해주세요."
        }
    }
}
