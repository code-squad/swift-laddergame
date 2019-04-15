//
//  InputView.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputQuestion: String {
    case playerQuestion = "참여할 사람은 몇 명인가요?"
    case ladderHeightQuestion = "최대 사다리 높이는 몇 개인가요?"
}

struct InputView {
    private var players: [LadderPlayer]
    private var ladderHeight: Int
    
    func ask(question: InputQuestion) -> String {
        print(question.rawValue)
        let answer = readLine() ?? "0"
        
        return answer
    }
    
    mutating func inputPlayers() {
        let players = ask(question: .playerQuestion).split(separator: ",")
        
        for player in players {
            self.players.append(LadderPlayer(name: String(player)))
        }
    }
    
    mutating func inputLadderHeight() {
        guard let ladderHeight = Int(ask(question: .ladderHeightQuestion)), ladderHeight > 0 else { return }
        
        self.ladderHeight = ladderHeight
    }
    
    mutating func inputView() -> (players: [LadderPlayer], ladderHeight: Int) {
        inputPlayers()
        inputLadderHeight()
        
        return (players, ladderHeight)
    }
}
