//
//  LadderGame.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
   private (set) var height = 0
   private var players = [LadderPlayer]()
    
    //LadderPlayer 타입 인스턴스를 어레이(프로퍼티)에 추가하는 함수
    init (_ playerNames: [String], _ ladderHeight: Int) {
        for playerName in playerNames {
            let ladderPlayer = LadderPlayer(name: playerName)
            players.append(ladderPlayer)
        }
        self.height = ladderHeight
    }
    
    
    //사다리의 사이사이 bar를 랜덤으로 만들고 2차원 배열로 저장
    func randomBarInfo() -> [[Bool]] {
        var randomBars : [[Bool]] = Array(repeating: Array(repeating: true, count:players.count-1), count: height)
        for i in 0..<height {
            for j in 0..<(players.count-1) {
                if Int(arc4random_uniform(2)) == 1 {
                    randomBars[i][j] = true
                } else {
                    randomBars[i][j] = false
                }
            }
        }
        return randomBars
    }
    
    
    //player의 이름을 배열로 담아 가져오는 함수
    func playerNamesInfo () -> [String] {
        var playerNames = [String]()
        for turn in 0..<players.count {
            playerNames.append(players[turn].name)
        }
        return playerNames
    }
    
}

