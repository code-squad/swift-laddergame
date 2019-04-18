//
//  InputView.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputQuestion: String {
    case playerQuestion = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case ladderHeightQuestion = "최대 사다리 높이는 몇 개인가요?"
}

enum InputError: Error {
    case invalidInput
}

extension InputError: LocalizedError {
    public var errorDescription: String? {
        return "입력 오류"
    }
}

struct InputView {
    private(set) var players: [LadderPlayer] = []
    private(set) var ladderHeight: Int = 0
    
    private func ask(question: InputQuestion) throws -> String {
        print(question.rawValue)
        guard let answer = readLine() else { throw InputError.invalidInput }
        
        return answer
    }
    
    private mutating func inputPlayers() throws {
        let playersText = try ask(question: .playerQuestion)
        let players = playersText.split(separator: ",")
        
        for player in players {
            self.players.append(try LadderPlayer(name: String(player)))
        }
    }
    
    private mutating func inputLadderHeight() throws {
        let ladderHeightText = try ask(question: .ladderHeightQuestion)
        guard let ladderHeight = Int(ladderHeightText) else { throw InputError.invalidInput }
        
        self.ladderHeight = ladderHeight
    }
    
    init() throws {
        players = []
        ladderHeight = 0
        
        try inputPlayers()
        try inputLadderHeight()
    }
}
