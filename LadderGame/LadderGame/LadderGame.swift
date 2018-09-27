//
//  LadderGame.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var names = [LadderPlayer]()
    var ladder = [[String]]()
    
    init(height:Int, names:String) {
        self.height = height
        for i in names.split(separator: ",") {
            self.names.append(LadderPlayer(name: String(i)))
        }
        self.ladder = makeLadder()
    }
    
    func makeLadder() -> [[String]]{
        var madeLadder = [[String]]()
        for _ in 0..<height {
            madeLadder.append(self.putStepInLadder())
        }
        return madeLadder
    }
    
    func putStepInLadder() -> [String] {
        var layerOfLadder = Array(repeating: LadderStep().kindOfStep[1], count: names.count - 1)    //kindOfStep[1] == "     "
        for i in layerOfLadder.startIndex..<layerOfLadder.endIndex {
            guard i == 0 || layerOfLadder[i-1] == "     " else {continue}
            layerOfLadder[i] = LadderStep().randomStep()
        }
        return layerOfLadder
    }
    
}
