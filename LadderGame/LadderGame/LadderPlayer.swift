//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
struct LadderPlayer {
    var name : String = ""
    
    mutating func setName(player name: String) {
        self.name = name
    }
    
    func getName() -> String{
        return name
    }
    
}
