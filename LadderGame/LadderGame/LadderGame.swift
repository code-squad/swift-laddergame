//
//  LadderGame.swift
//  LadderGame
//
//  Created by 이진영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private let players: [LadderPlayer]
    private let height: Int
    private(set) var ladder: [[LadderStep]]
    
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
        ladder = [[]]
        
        createLadder()
    }
    
    ///사다리 생성 함수
    private mutating func createLadder() {
        let columnSize = players.count - 1
        let ladder = Array(repeating: Array(repeating: LadderStep(), count: columnSize), count: height)
        
        self.ladder = ladder
        
        configureLadder()
    }
    
    ///규칙에 따라 사다리 검증 후 랜덤 값 반환
    private func randomComponent(rowNumber: Int, columnNumber: Int) -> Bool {
        if columnNumber == 0 {
            return Bool.random()
        }
        
        //이전 값이 true일 경우 false 반환
        if ladder[rowNumber][columnNumber - 1].component == true {
            return false
        }

        return Bool.random()
    }

    ///사다리 행 구성 함수
    private mutating func configureLadderRow(rowNumber: Int) {
        var component: Bool
        
        for columnNumber in 0..<ladder[rowNumber].count {
            component = randomComponent(rowNumber: rowNumber, columnNumber: columnNumber)
            ladder[rowNumber][columnNumber].changeComponent(component: component)
        }
    }

    ///사다리 구성 함수
    private mutating func configureLadder() {
        for rowNumber in 0..<ladder.count {
            configureLadderRow(rowNumber: rowNumber)
        }
    }
    
}
