//
//  LadderGame.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    let gameOption : GameOption
    private var players : [LadderPlayer] = []
    
    init (_ option: GameOption) {
        self.gameOption = option
        
        for playerName in gameOption.inputPlayerNames {
            let ladderPlayer = LadderPlayer(name: playerName)
            players.append(ladderPlayer)
        }
    }
  
    //사다리의 사이사이 bar를 랜덤으로 만들고 2차원 배열로 저장
    private func randomBarInfo() -> [[Bool]] {
        var randomBars : [[Bool]] = Array(repeating: Array(repeating: true, count:gameOption.inputPlayerNames.count-1), count: gameOption.inputHeight)
        for i in 0..<gameOption.inputHeight {
                randomBars[i][0] = makeRandomBar(i, 0)
            for j in 1..<gameOption.inputPlayerNames.count-1 {
                if randomBars[i][j-1] == true {
                    randomBars[i][j] = false
                } else {
                    randomBars[i][j] = makeRandomBar(i, j)
                }
            }
        }
        return randomBars
    }
    
    private func makeRandomBar (_ i : Int, _ j : Int) -> Bool {
        if Int(arc4random_uniform(2)) == 1 {
            return true
        } else {
            return false
        }
    }
    
    
    //player의 이름을 배열로 담아 가져오는 함수
   private func playerNamesInfo () -> [String] {
        var playerNames = [String]()
        for turn in 0..<players.count {
            playerNames.append(players[turn].name)
        }
        return playerNames
    }
    
    //LadderInfo의 인스턴스를 만드는 함수
    func genarateLadder () -> LadderInfo {
        let ladderInfo = LadderInfo(gameOption.inputHeight, playerNamesInfo(), randomBarInfo())
    
    return ladderInfo
    }

}

