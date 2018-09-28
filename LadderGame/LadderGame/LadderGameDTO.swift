//
//  LadderGameDTO.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 28..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameDTO {
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
        self.ladder = LadderGame().makeLadder(height: self.height, numberOfPeople:self.names.count)
    }
    
    func getHeight() -> Int{
        return self.height
    }
    func getNames() -> [LadderPlayer] {
        return self.names
    }
    func getLadder() -> [[Bool]] {
        return self.ladder
    }
    
    mutating func setHeight(_ height:Int) {
        self.height = height
    }
    mutating func setNames(_ names:[LadderPlayer]) {
        self.names = names
    }
    mutating func setLadder(_ ladder:[[Bool]]) {
        self.ladder = ladder
    }
}
