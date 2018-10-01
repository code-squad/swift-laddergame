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
    private var names = [LadderPlayer]()
    private var ladder = [[Bool]]()
    
    init(height:Int, names:String) {
        self.height = height
        var participant:LadderPlayer
        for i in names.split(separator: ",") {
            participant = LadderPlayer(name: String(i))
            self.names.append(participant)
        }
        self.ladder = makeLadder(height: self.height, numberOfPeople:self.names.count)
    }
    
    private func makeLadder(height:Int, numberOfPeople:Int) -> [[Bool]]{
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
            layerOfLadder[i] = self.randomStep()
        }
        return layerOfLadder
    }
    
    private func randomStep() -> Bool {
        return arc4random_uniform(2) == 1
    }
    
    func translateToDTO() -> LadderGameDTO{
        let ladderGameDTO = LadderGameDTO(names: self.names,
                                          ladder: self.ladder)
        return ladderGameDTO
    }
}
