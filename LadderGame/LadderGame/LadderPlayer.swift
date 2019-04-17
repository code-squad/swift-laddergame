//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by joon-ho kil on 4/12/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer: Equatable {
    let name : String
    
    init (playerName: String) throws {
        if(playerName.count>5) { throw LadderInputErrors.toLongName }
        name = playerName
    }
}
