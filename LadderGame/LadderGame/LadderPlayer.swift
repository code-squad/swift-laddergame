//
//  File.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private let playerName : String
    
    init(name: String){
        playerName = name
    }
    
    func getPlayerName() -> String{
        return playerName
    }
}
