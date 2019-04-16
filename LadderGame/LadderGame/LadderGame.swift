//
//  LadderGame.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct LadderGame {
    var height = 0
    var names : [LadderPlayer]
    var numberOfPlayers: Int{
        get {
            return self.numberOfPlayers
        }
        set {
            numberOfPlayers = names.count
        }
    }    
}
