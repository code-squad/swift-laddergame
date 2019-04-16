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

struct InputView {
    private(set) var players: [LadderPlayer]
    private(set) var ladderHeight: Int
    
    func ask(question: InputQuestion) -> String {
        print(question.rawValue)
        let answer = readLine() ?? "0"
        
        return answer
    }
    
    mutating func inputPlayers() {
        let players = ask(question: .playerQuestion).split(separator: ",")
        
        guard 2...5 ~= players.count else { return }
        
        for player in players {
            self.players.append(LadderPlayer(name: String(player)))
        }
    }
    
    mutating func inputLadderHeight() {
        guard let ladderHeight = Int(ask(question: .ladderHeightQuestion)), ladderHeight > 0 else { return }
        
        self.ladderHeight = ladderHeight
    }
    
    init() {
        players = []
        ladderHeight = 0

        inputPlayers()
        inputLadderHeight()
    }
}
