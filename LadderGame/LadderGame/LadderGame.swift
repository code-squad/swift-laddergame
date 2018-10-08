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
    private var players = [LadderPlayer]()
    private var ladder = [[LadderStep]]()
    
    init(height:Int, names:String) {
        self.height = height
        var participant:LadderPlayer
        for i in names.split(separator: ",") {
            participant = LadderPlayer(name: String(i))
            self.players.append(participant)
        }
    }
    
    mutating func makeLadder(){
        var madeLadder = [[LadderStep]]()
        for _ in 0..<self.height {
            madeLadder.append(self.putStepInLadder(self.players.count))
        }
        self.ladder = madeLadder
    }
    
    private func putStepInLadder(_ numberOfPeople:Int) -> [LadderStep] {
        var layerOfLadder = Array(repeating: LadderStep(), count: numberOfPeople - 1)
        for i in layerOfLadder.startIndex..<layerOfLadder.endIndex {
            guard i == 0 || layerOfLadder[i-1].hasStep == false else {continue}
            layerOfLadder[i].randomStep()
        }
        return layerOfLadder
    }
    
    func translateToDTO() -> LadderGameDTO{
        var playerNames = [String]()
        for i in self.players {
            playerNames.append(i.name)
        }
        let ladderGameDTO = LadderGameDTO(names: playerNames,
                                          ladder: self.ladder)
        return ladderGameDTO
    }
}
