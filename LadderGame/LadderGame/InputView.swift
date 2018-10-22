//
//  InputView.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation

extension String {
    func splitByComma() -> [String.SubSequence] {
        return self.split(separator: ",")
    }
}

struct InputView {
    
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    static func getUserLadder() -> Int {
        let height = readInput(ment: "최대 사다리 높이는 몇 개인가요?")
        return Int(height) ?? 0
    }
    
    static private func readPlayerName() -> String {
        let players = readInput(ment: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        return players
    }
    
    private static func checkPlayerName(_ players: [String.SubSequence]) -> Bool {
        if players.contains(where: {String($0).count > 5}) {
            return false
        }
        return true
    }
    
    static func readPlayerNames() -> [LadderPlayer]?{
        let playerName = readPlayerName()
        let commaName = playerName.splitByComma()
        
        return checkPlayerName(commaName) ? commaName.compactMap {LadderPlayer(name: String($0))} : nil
    }
}


