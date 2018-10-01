//
//  LadderGame.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var height = 0
    private var players = [LadderPlayer]()
    
    init(height:Int, names:String) {
        self.height = height
        for name in separate(names) {
            self.players.append(LadderPlayer(name:name))
        }
    }
    
    private func separate(_ names:String) -> [String] {
        return names.split(separator: ",").map({String($0)})
    }
    
    // 하나의 행에서 연결된 step이 있는지 검사 및 삭제 후 [LadderStep] 리턴
    private func removeConnectionOf(_ ladderRow:[LadderStep]) -> [LadderStep] {
        var ladderRow = ladderRow
        for index in 1...ladderRow.count-1 {
            if (ladderRow[index-1].step && ladderRow[index].step) {
                ladderRow[index-Int.random(in: 0...1)].step = false
            }
        }
        return ladderRow
    }
    
    // 사다리의 열 하나를 랜덤으로 만들고, removeConnectionOf() 거친 후 [LadderStep] 리턴
    private func makeLadderRow(rowIndex:Int) -> [LadderStep] {
        var ladderRow : [LadderStep] = Array(repeating: LadderStep(), count: rowIndex)
        for index in ladderRow.indices {
            ladderRow[index].step = Bool.random()
        }
        ladderRow = removeConnectionOf(ladderRow)
        return ladderRow
    }
    
    // makeLadderRow()으로 만든 열을 쌓아 사다리배열 [[LadderStep]] 리턴
    func makeLadder() -> [[LadderStep]] {
        var ladders : [[LadderStep]] = []
        for _ in 1...height {
            ladders.append(makeLadderRow(rowIndex: (players.count-1)))
        }
        return ladders
    }
    
    func getPlayerNames() -> [String] {
        var playerNames = [String]()
        for player in players {
            playerNames.append(player.name)
        }
        return playerNames
    }
    
}
