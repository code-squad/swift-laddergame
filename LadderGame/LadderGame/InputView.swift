//
//  InputView.swift
//  LadderGame
//
//  Created by cocoa on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func makeGame() -> LadderGame {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let playerNamesInput = readLine() ?? ""
        print("최대 사다리 높이는 몇 개인가요?")
        let heightOfLadders = readLine() ?? ""
        
        let players = playerNamesInput.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "")
            .split(separator: ",")
            .map { String($0) }
            .map { Player(name: $0) }
        
        var game = LadderGame(players: players, heightOfLadders: Int(heightOfLadders) ?? 0)
        game.makeLadders()
        return game
    }
}
