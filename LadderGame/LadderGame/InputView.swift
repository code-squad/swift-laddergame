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
    
    private static func readAnswer(_ question: Question) throws -> String {
        print(question.rawValue)
        guard let answer = readLine() else {
            throw InputError.emptyValue
        }
        
        return answer
    }
    
    func readNames() throws -> [LadderPlayer] {
        
        let answer = try InputView.readAnswer(Question.player)
        // case player = "참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
        let names = answer.components(separatedBy: ",").map { LadderPlayer(name: $0) }
        // a,b,c 라는 사람이 [LadderPlayer]로 들어감
        
        return names
    }
    
    func readLayer() throws -> Int {
        
        let answer = try InputView.readAnswer(Question.Layer)
        // case Layer = "최대 사다리 높이는 몇 개인가요?"
        
        guard let Layer = Int(answer.trimmingCharacters(in: CharacterSet.whitespaces)) else {
            throw InputError.incorrectFormat
            // case .incorrectFormat: return "정확하지 않은 형식입니다. 0 이상의 정수만 입력해주세요."
        }
    
        return Layer
        // 입력한 사다리 갯수 출력
    }
}


// 예외 처리
enum InputError: Error {
    case incorrectFormat
    case emptyValue
    
    var description: String {
        switch self {
        case .incorrectFormat: return "정확하지 않은 형식입니다. 0 이상의 정수만 입력해주세요."
        case .emptyValue: return "값이 없습니다."

        }
    }
}

