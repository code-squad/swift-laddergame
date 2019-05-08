//
//  ResultView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    private var oneLadderFloor = String()
    
    mutating func makeOneLadderFloor(ladderFloorCount: Int, showLadders: [[String]]) {
        let ladderWidth = showLadders[0].count
        
        var verticalLine = "|"
        for ladderStepCount in 0 ..< ladderWidth {
            verticalLine = verticalLine + showLadders[ladderFloorCount][ladderStepCount]
            verticalLine = verticalLine + "|"
        }
        self.oneLadderFloor = verticalLine
        verticalLine = " "
    }
    
    
    @discardableResult mutating func printLadders(ladders: [[String]]) -> [String] {
        let ladderHeight = ladders.count
        var ladderFloors = [String]()
        
        for ladderHeightCount in 0 ..< ladderHeight {
            self.makeOneLadderFloor(ladderFloorCount: ladderHeightCount, showLadders: ladders)
            ladderFloors.append(oneLadderFloor)
            print(oneLadderFloor)
        }
        return ladderFloors
    }
    
    //플레이어이름 출력하는 함수
    func arrangeName(playerNames: Array<String>) {
        var alignedName = String()
        
        for index in 0..<playerNames.count {
            var name = playerNames[index]
            while name.count < 6 {
                name.insert(" ", at: name.endIndex)
            }
            alignedName = alignedName + name
        }
        print(alignedName)
    }
}
