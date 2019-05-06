//
//  ResultView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
     var oneLadderFloor = String()
    
     mutating func makeHorizontalLadderString(ladderFloorCount: Int, showLadders: [[String]]) {
        let ladderWidth = showLadders[0].count
        
        var verticalLine = "|"
        for ladderStepCount in 0 ..< ladderWidth {
            verticalLine = verticalLine + showLadders[ladderFloorCount][ladderStepCount]
            verticalLine = verticalLine + "|"
        }
        self.oneLadderFloor = verticalLine
        verticalLine = " "
    }

    
    @discardableResult mutating func showLadders(ladders: [[String]]) -> [String] {
        let ladderHeight = ladders.count
        var ladderFloors = [String]()
        
        for ladderHeightCount in 0 ..< ladderHeight {
            self.makeHorizontalLadderString(ladderFloorCount: ladderHeightCount, showLadders: ladders)
            ladderFloors.append(oneLadderFloor)
            print(oneLadderFloor)
        }
        return ladderFloors
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
