//
//  LadderGame.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var players = [LadderPlayer]()
    
    //LaddePlayer 타입 인스턴스를 어레이(프로퍼티)에 추가하는 함수
    mutating func setGameOption (_ gameOption: (playerNames: [String], ladderHeight: Int)) {
        for playerName in gameOption.playerNames {
            let ladderPlayer = LadderPlayer(name: playerName)
            players.append(ladderPlayer)
        }
        self.height = gameOption.ladderHeight
    }
    
    //사다리 한 층을 만드는 함수
    func oneLadder (_ countOfUser: Int) -> Array<String> {
        var oneLadderLine = [String](repeating:" ", count: (((countOfUser * 2)+4)))
        for barPosition in 2..<((countOfUser*2)+2) where barPosition % 2 == 0 {
            oneLadderLine[barPosition] = "|"
        }
        for barPosition in 3..<((countOfUser*2)+1) where barPosition % 2 != 0 {
            oneLadderLine[barPosition] = setRandomBar()
        }
        return oneLadderLine
    }
    
    //사다리 한 층에서 사이사이 bar를 랜덤으로 만드는 함수.
    func setRandomBar() -> String {
        var randomIndex: Int = 0
        randomIndex = Int(arc4random_uniform(2))
        guard randomIndex == 0 else {
            return "     "
        }
        return "-----"
    }
    
    //player의 이름을 사다리의 마지막줄에 tagging하는 함수
    func playersTag() -> Array<String> {
        var playersName = [String]()
        for turn in 0..<players.count {
            playersName.append(players[turn].getName())
        }
        return playersName
    }
    
    
    //전체 사다리를 완성하는 함수 - 사다리 높이만큼 2차원배열을 늘리는 함수 (사다리 높이만큼 oneLadder를 추가)
    func generateLadder() -> Array<Array<String>> {
        var ladder : [[String]] = [[]]
        for _ in 0..<height {
            ladder.append(oneLadder(players.count))
        }
        return ladder
    }
    
}
