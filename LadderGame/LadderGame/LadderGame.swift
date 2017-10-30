//
//  LadderGame.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var names : [LadderPlayer]
    
    init(height: Int) {
        self.height = height
        self.names = []
    }
    
    init(names: [LadderPlayer]) {
        self.names = names
    }
    
    func seperateNameOfPlayers(inputValue: String) -> Array<String>{        
        return inputValue.split(separator: ",").map(String.init)
    }
}
