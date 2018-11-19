//
//  CheckError.swift
//  LadderGame
//
//  Created by 임차혁 on 2018. 11. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
// 사용자 입력 Error 경우
struct CheckError {
    func checkPlayerName(_ ladderPlayer: [LadderPlayer]) -> Bool {
        for player in ladderPlayer {
            if player.name.count > 5 || player.name.isEmpty { return false }
        }
        return true
    }
    func checkLadderHeight(_ ladderHeight: Int) -> Bool {
        return ladderHeight > 1 && ladderHeight < Int.max
    }
    func checkEverything(ladderHeight: Int, ladderPlayer: [LadderPlayer]) -> Bool {
        return self.checkPlayerName(ladderPlayer) && self.checkLadderHeight(ladderHeight)
    }
}
