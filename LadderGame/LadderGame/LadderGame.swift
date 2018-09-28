//
//  LadderGame.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    func makeLadder(height:Int, numberOfPeople:Int) -> [[Bool]]{
        var madeLadder = [[Bool]]()
        for _ in 0..<height {
            madeLadder.append(self.putStepInLadder(numberOfPeople))
        }
        return madeLadder
    }
    
    private func putStepInLadder(_ numberOfPeople:Int) -> [Bool] {
        var layerOfLadder = Array(repeating: false, count: numberOfPeople - 1)
        for i in layerOfLadder.startIndex..<layerOfLadder.endIndex {
            guard i == 0 || layerOfLadder[i-1] == false else {continue}
            layerOfLadder[i] = LadderStep().randomStep()
        }
        return layerOfLadder
    }
}
