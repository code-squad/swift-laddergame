//
//  LadderInfo.swift
//  LadderGame
//
//  Created by 이동영 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderInfo{
    private let players : [LadderPlayer]
    private let height : Int
    private let width :Int
    private let numOfSteps : Int
    
    init(players:[LadderPlayer],height:Int) {
        self.players = players
        self.height = height
        self.width = players.count*2-1
        self.numOfSteps = players.count - 1
    }
    
    public func getPlayers()->[LadderPlayer]{
        return self.players
    }
    public func getHeight()->(Int){
        return self.height
    }
    public func getWidth()->(Int){
        return self.width
    }
    public func getNumOfSteps()->(Int){
        return self.numOfSteps
    }
    
}
