//
//  LadderGame.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    //사다리높이만큼 사다리그림을 1행씩 증가시키는 함수
    func increaseByladderLine(ladders: [[String]]) {
        let ladderHeight = ladders.count
        
        for ladderHeightCount in 0 ..< ladderHeight {
            ResultView.showLadders(ladderFloorCount: ladderHeightCount, showLadders: ladders)
        }
    }
    

    //플레이어이름 출력하는 함수
    func showPlayerName(playerName: Array<String>) {
        var showName = String()
        
        for index in 0..<playerName.count {
            var name = playerName[index]
            while name.count < 6 {
                name.insert(" ", at: name.endIndex)
            }
            showName = showName + name
        }
        print(showName)
    }

    
    
}
