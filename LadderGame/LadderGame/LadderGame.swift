//
//  LadderGame.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
   internal private (set) var height = 0
   internal private (set) var players = [LadderPlayer]()
    
    //LaddePlayer 타입 인스턴스를 어레이(프로퍼티)에 추가하는 함수
    init (_ gameOption: (playerNames: [String], ladderHeight: Int)) {
        for playerName in gameOption.playerNames {
            let ladderPlayer = LadderPlayer(name: playerName)
            players.append(ladderPlayer)
        }
        self.height = gameOption.ladderHeight
    }
    
    func getHeight() -> Int {
        return self.height
    }
    
    func getPlayers() -> [LadderPlayer]{
        return self.players
    }
    
    //사다리 한 층에서 사이사이 bar를 랜덤으로 만드는 함수.
    func setRandomBar() -> Bool {
        if Int(arc4random_uniform(2)) == 1 {
            return true
        } else {
            return false
        }
    }
    
    //player의 이름을 String배열로 담아서 리턴
    func playerNameTags() -> Array<String> {
        var playersName = [String]()
        for turn in 0..<players.count {
            playersName.append(players[turn].getName())
        }
        return playersName
    }
    
}

