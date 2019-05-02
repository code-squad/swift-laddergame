//
//  ResultView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
   static func showLadders(ladderFloorCount: Int, showLadders: [[String]]) {
        let ladderWidth = showLadders[0].count
        
        var verticalLine = "|"
        for ladderStepCount in 0 ..< ladderWidth {
            verticalLine = verticalLine + showLadders[ladderFloorCount][ladderStepCount]
            verticalLine = verticalLine + "|"
        }
        print(verticalLine)
        verticalLine = " "
    }

    
    
    //플레이어이름 출력하는 함수
    static func showPlayerName(playerName: Array<String>) {
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
