//
//  LadderGameDTO.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 28..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameDTO {
    private(set) var names = [LadderPlayer]()
    private(set) var ladder = [[Bool]]()
    
    init(names:[LadderPlayer], ladder:[[Bool]]) {
        self.names = names
        self.ladder = ladder
    }
    
}
