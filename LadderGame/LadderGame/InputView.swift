//
//  InputView.swift
//  LadderGame
//
//  Created by JieunKim on 21/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//


import Foundation

enum Question: String {
    case player = "참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case Layer = "최대 사다리 높이는 몇 개인가요?"
}

struct InputView {
    
    private static func readText(_ question: Question) throws -> String {
        print(question.rawValue)
        guard let answer = readLine() else {
            throw InputError.emptyValue
        }
        
        return answer
    }
    
    func readNames() throws -> [LadderPlayer] {
        let answer = try InputView.readText(Question.player)
        let names = answer.components(separatedBy: ",").map { LadderPlayer(name: $0) }
        
        for player in names {
            guard player.name.count < 6 else {
                throw InputError.wrongValue
            }
        }
 
        return names
    }
    
    func readLayer() throws -> Int {
        
        let answer = try InputView.readText(Question.Layer)
        guard let Layer = Int(answer.trimmingCharacters(in: CharacterSet.whitespaces)) else {
            throw InputError.incorrectFormat
        }
        
        return Layer
    }
}

enum InputError: Error {
    case incorrectFormat
    case emptyValue
    case wrongValue
    
    var description: String {
        switch self {
            
        case .wrongValue: return "글자수가 초과되었습니다."
        case .incorrectFormat: return "정확하지 않은 형식입니다. 0 이상의 정수만 입력해주세요."
        case .emptyValue: return "값이 없습니다."

        }
    }
}

