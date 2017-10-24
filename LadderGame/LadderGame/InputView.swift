//
//  InputView.swift
//  LadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    // New Game
    static func setNewGame() -> LadderGameSetter {
        var playerNames : [String.SubSequence]
        var ladderHeight : Int = 0
        repeat {
            playerNames = getPlayers()
            ladderHeight = getLadderHeight()
        } while(!(playerNames.count > 0) || !(ladderHeight > 0))
        return (playerNames, ladderHeight)
    }
    
    // 참여인원 입력
    static private func getPlayers() -> [String.SubSequence] {
        var nameLengthFlag : Bool = true
        var playerNames : [String.SubSequence]
        repeat {
            print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
            playerNames = String(readLine() ?? "").split(separator: ",")
            nameLengthFlag = checkNameLength(playerNames: playerNames)
        } while (!nameLengthFlag)
        return playerNames
    }
    
    // 최대 사다리 높이 입력
    static private func getLadderHeight() -> Int {
        print("최대 사다리의 높이는 몇 개인가요?")
        return Int(readLine() ?? "0") ?? 0
    }
    
    // 이름 입력값 5글자 이상 체크
    static private func checkNameLength(playerNames: [String.SubSequence]) -> Bool {
        for playerName in playerNames where String(playerName).count > 5 {
            print("이름은 영문 5자리 이하만 가능합니다.")
            return false
        }
        return true
    }
}
