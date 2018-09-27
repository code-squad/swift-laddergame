//
//  LadderGame.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var height = 0
    var names = [LadderPlayer]()
    var ladder = [[Bool]]()
    
    init(height:Int, names:String) {
        self.height = height
        var participant:LadderPlayer
        for i in names.split(separator: ",") {
            participant = LadderPlayer(name: String(i))
            self.names.append(participant)
        }
        
        self.ladder = makeLadder()
    }
    
    private func makeLadder() -> [[Bool]]{
        var madeLadder = [[Bool]]()
        for _ in 0..<height {
            madeLadder.append(self.putStepInLadder())
        }
        return madeLadder
    }
    
    private func putStepInLadder() -> [Bool] {
        var layerOfLadder = Array(repeating: false, count: names.count - 1)
        for i in layerOfLadder.startIndex..<layerOfLadder.endIndex {
            guard i == 0 || layerOfLadder[i-1] == false else {continue}
            layerOfLadder[i] = LadderStep().randomStep()
        }
        return layerOfLadder
    }
    
}
